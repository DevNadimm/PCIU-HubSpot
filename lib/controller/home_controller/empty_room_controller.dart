import 'package:get/get.dart';
import 'package:pciu_hubspot/core/models/empty_room_model.dart';
import 'package:pciu_hubspot/core/network/network_caller.dart';
import 'package:pciu_hubspot/core/urls.dart';

class EmptyRoomController extends GetxController {
  static final instance = Get.find<EmptyRoomController>();

  bool _inProgress = false;
  String? _errorMessage;
  List<EmptyRoomModel>? emptyRoomList;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  bool isSuccess = false;

  void setInProgress(bool value) {
    _inProgress = value;
    update();
  }

  Future<bool> getEmptyRoom() async {
    try {
      setInProgress(true);

      final result = await NetworkCaller.getRequest(url: Urls.emptyRoom);
      if (result.isSuccess) {
        _errorMessage = null;
        isSuccess = true;

        List<dynamic> responseData = result.responseData;
        emptyRoomList = responseData.map((e) => EmptyRoomModel.fromJson(e)).toList();
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
