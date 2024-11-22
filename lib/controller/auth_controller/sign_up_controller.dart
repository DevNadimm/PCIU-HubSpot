import 'package:get/get.dart';
import 'package:pciu_hubspot/core/network/network_caller.dart';
import 'package:pciu_hubspot/core/urls.dart';

class SignUpController extends GetxController {
  static final instance = Get.find<SignUpController>();

  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool isSuccess = false;

  Future<bool> signUp({
    required String name,
    required String studentId,
    required String email,
    required String password,
  }) async {
    _inProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "name": name,
      "email": email,
      "password": password,
      "role": "user",
      "photo": null,
      "sid": studentId,
      "status": true
    };

    try {
      final response = await NetworkCaller.putRequest(
        url: Urls.signUp,
        body: requestBody,
      );

      if (response.isSuccess) {
        isSuccess = true;
        _errorMessage = null;
      } else {
        isSuccess = false;
        _errorMessage = response.errorMessage;
      }
    } catch (e) {
      isSuccess = false;
      _errorMessage = 'An error occurred: $e';
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
