import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/auth_controller.dart';
import 'package:pciu_hubspot/core/network/network_caller.dart';
import 'package:pciu_hubspot/core/urls.dart';

class SignInController extends GetxController {
  static final instance = Get.find<SignInController>();

  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool isSuccess = false;

  Future<bool> signIn({required String email, required String password}) async {
    _inProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "identifier": email,
      "password": password
    };

    final response = await NetworkCaller.postRequest(
      url: Urls.signIn,
      body: requestBody,
    );

    if (response.isSuccess) {
      isSuccess = true;
      final data = response.responseData;
      if (data.containsKey('token')) {
        final token = data['token'];
        await AuthController.saveAccessToken(token);
      } else {
        debugPrint('Token not found in response');
        isSuccess = true;
      }
    } else {
      isSuccess = false;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}