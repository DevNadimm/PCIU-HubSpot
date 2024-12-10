import 'package:get/get.dart';
import 'package:pciu_hubspot/core/network/network_caller.dart';
import 'package:pciu_hubspot/core/urls.dart';

class WriteReviewController extends GetxController {
  static final instance = Get.find<WriteReviewController>();

  String? _errorMessage;
  bool _inProgress = false;

  String? get errorMessage => _errorMessage;
  bool get inProgress => _inProgress;

  bool isSuccess = false;

  void setInProgress(bool value) {
    _inProgress = value;
    update();
  }

  Future<bool> writeReview(Map<String, dynamic> body) async {
    try {
      setInProgress(true);
      final result = await NetworkCaller.postRequest(url: Urls.writeReview, body: body);
      if (result.isSuccess) {
        isSuccess = true;
        _errorMessage = null;
      } else {
        isSuccess = false;
        _errorMessage = result.errorMessage;
      }
    } catch (e) {
      isSuccess = false;
      _errorMessage = e.toString();
    } finally {
      setInProgress(false);
    }
    return isSuccess;
  }
}
