import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/auth_controller/sign_in_controller.dart';
import 'package:pciu_hubspot/controller/network_controller/network_controller.dart';
import '../auth_controller/sign_up_controller.dart';

class ControllerBinders extends Bindings{
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.put(NetworkController());
  }
}