import 'package:get/get.dart';
import 'auth_controller/sign_up_controller.dart';

class ControllerBinders extends Bindings{
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}