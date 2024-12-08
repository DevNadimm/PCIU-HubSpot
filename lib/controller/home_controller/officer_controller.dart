import 'package:get/get.dart';
import 'package:pciu_hubspot/core/models/officer_model.dart';
import 'package:pciu_hubspot/core/network/network_caller.dart';
import 'package:pciu_hubspot/core/urls.dart';

class OfficerController extends GetxController {
  static final instance = Get.find<OfficerController>();

  bool _inProgress = false;
  String? _errorMessage;
  List<Officers>? officerList;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  bool isSuccess = false;

  void setInProgress(bool value) {
    _inProgress = value;
    update();
  }

  Future<bool> getFacultyMember() async {
    try {
      setInProgress(true);

      final result = await NetworkCaller.getRequest(url: Urls.officers());
      if (result.isSuccess) {
        _errorMessage = null;
        isSuccess = true;

        final response = OfficerModel.fromJson(result.responseData);
        officerList = response.officers;
      } else {
        _errorMessage = result.errorMessage;
        isSuccess = false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      isSuccess = false;
    } finally {
      setInProgress(false);
    }
    return isSuccess;
  }
}
