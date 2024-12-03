import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/home_controller/student_details_controller.dart';
import 'package:pciu_hubspot/controller/shared_preferences_controller/auth_controller_prefs.dart';
import 'package:pciu_hubspot/core/network/network_caller.dart';
import 'package:pciu_hubspot/core/urls.dart';

class SignInController extends GetxController {
  static final instance = Get.find<SignInController>();

  bool _signInInProgress = false;
  bool get signInInProgress => _signInInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool isSuccess = false;

  Future<bool> signIn({required String email, required String password}) async {
    _signInInProgress = true;
    update();

    try {
      final response = await NetworkCaller.getRequest(url: Urls.userDetails(email));

      if (response.isSuccess) {
        final data = response.responseData;

        if (data.containsKey('data') && data['data'] == 'UserNotFound') {
          _handleUserNotFound(email);
          return false;
        } else {
          final sid = data['sid'];
          final userEmail = data['email'];
          final name = data['name'];

          return await _signInUser(email: userEmail, name: name, sid: sid, password: password);
        }
      } else {
        return _handleSignInError('We encountered an issue while fetching your details. Please try again.');
      }
    } catch (e) {
      return _handleSignInError('Something went wrong. Please check your internet connection and try again later.');
    } finally {
      _signInInProgress = false;
      update();
    }
  }

  Future<bool> _signInUser({required String email, required String name, required String password, required String sid}) async {
    try {
      Map<String, dynamic> requestBody = {
        "identifier": email,
        "password": password
      };
      debugPrint('Signing in with: EMAIL: $email\n, NAME: $name\n, SID: $sid\n');

      final response = await NetworkCaller.postRequest(
        url: Urls.signIn,
        body: requestBody,
      );

      if (response.isSuccess) {
        final data = response.responseData;
        if (data.containsKey('token')) {
          final token = data['token'];
          await AuthController.saveAccessToken(token);

          final studentDetailsController = StudentDetailsController.instance;
          final result = await studentDetailsController.getStudentDetails(
            email: email,
            nameOnEmail: name,
            sId: sid,
          );

          if(!result){
            if (!result) {
              isSuccess = false;
              return _handleSignInError(studentDetailsController.errorMessage!);
            }
          } else{
            isSuccess = true;
          }

        } else {
          debugPrint('Token not found in response');
          _errorMessage = 'We couldn’t log you in. Please try again later.';
          isSuccess = false;
        }
      } else {
        _errorMessage = 'Sign-in failed. Please check your email and password and try again.';
        isSuccess = false;
      }
    } catch (e) {
      _errorMessage = 'Something went wrong. Please check your internet connection and try again later.';
      isSuccess = false;
    }
    return isSuccess;
  }

  void _handleUserNotFound(String email) {
    isSuccess = false;
    _errorMessage = 'User not found for email $email.';
  }

  bool _handleSignInError(String error) {
    _errorMessage = error;
    return false;
  }
}
