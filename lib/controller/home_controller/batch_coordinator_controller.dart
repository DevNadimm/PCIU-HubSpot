import 'package:get/get.dart';
import 'package:pciu_hubspot/core/models/batch_coordinator_model.dart';
import 'package:pciu_hubspot/core/network/network_caller.dart';
import 'package:pciu_hubspot/core/urls.dart';

class BatchCoordinatorController extends GetxController {
  static final instance = Get.find<BatchCoordinatorController>();

  bool _inProgress = false;
  String? _errorMessage;
  List<BatchCoordinator>? batchCoordinatorList;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  bool isSuccess = false;

  void setInProgress(bool value) {
    _inProgress = value;
    update();
  }

  Future<bool> getBatchCoordinators() async {
    try {
      setInProgress(true);

      final result = await NetworkCaller.getRequest(url: Urls.batchCoordinator());
      if (result.isSuccess) {
        _errorMessage = null;
        isSuccess = true;

        final response = BatchCoordinatorModel.fromJson(result.responseData);
        batchCoordinatorList = response.batchCoordinator;
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
