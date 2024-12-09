import 'package:get/get.dart';
import 'package:pciu_hubspot/core/models/cr_model.dart';
import 'package:pciu_hubspot/core/network/network_caller.dart';
import 'package:pciu_hubspot/core/urls.dart';

class CRController extends GetxController {
  static final instance = Get.find<CRController>();

  bool _inProgress = false;
  String? _errorMessage;
  List<Crs>? crList;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  bool isSuccess = false;

  void setInProgress(bool value) {
    _inProgress = value;
    update();
  }

  Future<bool> getAllCr() async {
    try {
      setInProgress(true);

      final result = await NetworkCaller.getRequest(url: Urls.getAllCr());
      if (result.isSuccess) {
        _errorMessage = null;
        isSuccess = true;

        final response = CRModel.fromJson(result.responseData);
        crList = response.crs;
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
