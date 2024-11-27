import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/auth_controller/auth_controller_prefs.dart';
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

    Map<String, dynamic> requestBody = {
      "identifier": email,
      "password": password,
    };

    try {
      final response = await NetworkCaller.postRequest(
        url: Urls.signIn,
        body: requestBody,
      );

      if (response.isSuccess) {
        final data = response.responseData;
        if (data.containsKey('token')) {
          final token = data['token'];
          await AuthController.saveAccessToken(token);
          isSuccess = true;
        } else {
          debugPrint('Token not found in response');
          _errorMessage = 'We couldn’t log you in. Please try again later.';
        }
      } else {
        _errorMessage = 'Sign-in failed. Please check your email and password and try again.';
      }
    } catch (e) {
      _errorMessage = 'Something went wrong. Please check your internet connection and try again later.';
    }

    _signInInProgress = false;
    update();

    return isSuccess;
  }
}
