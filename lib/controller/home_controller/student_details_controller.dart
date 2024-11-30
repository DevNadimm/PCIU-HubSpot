import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/shared_preferences_controller/user_details_controller_prefs.dart';
import 'package:pciu_hubspot/core/network/network_caller.dart';
import 'package:pciu_hubspot/core/urls.dart';

class StudentDetailsController extends GetxController {
  static final instance = Get.find<StudentDetailsController>();

  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  bool isSuccess = false;

  void setInProgress(bool value) {
    _inProgress = value;
    update();
  }

  Future<bool> getStudentDetails({
    required String email,
    String? nameOnEmail,
    required String sId,
    String? photo,
  }) async {
    setInProgress(true);
    try {
      final trimmedSId = sId.replaceAll(' ', '');
      final studentResponse = await NetworkCaller.getRequest(url: Urls.studentInfo(trimmedSId));
      if (studentResponse.isSuccess) {
        final studentId = studentResponse.responseData['studentIdNo'];
        final studentName = studentResponse.responseData['StudentName'];
        final studentProgram = studentResponse.responseData['studentProgram'];
        final studentSession = studentResponse.responseData['studentSession'];
        final studentBatch = studentResponse.responseData['studentBatch'];
        final totalCredit = studentResponse.responseData['CrHr'];
        final shift = studentResponse.responseData['Shift'];
        final campus = studentResponse.responseData['Campus'];

        Map<String, dynamic> userDetailsMap = {
          'name': nameOnEmail,
          'email': email,
          'studentId': studentId,
          'studentName': studentName,
          'studentProgram': studentProgram,
          'studentSession': studentSession,
          'studentBatch': studentBatch,
          'totalCredit': totalCredit,
          'shift': shift,
          'campus': campus,
        };
        if (photo != null) {
          userDetailsMap.addAll({'photo': photo});
        }

        await UserDetailsController.saveUserDetails(userDetailsMap);
        await UserDetailsController.getUserDetails();

        isSuccess = true;
        _errorMessage = null;

        debugPrint("User Details: $userDetailsMap");
      } else {
        _errorMessage = "We couldn't fetch your student information. Please try again later.";
        isSuccess = false;
      }
    } catch (e) {
      _errorMessage = "Oops! Something went wrong. Please check your connection and try again.";
      isSuccess = false;
    } finally {
      setInProgress(false);
    }

    return isSuccess;
  }
}
