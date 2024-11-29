import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/shared_preferences_controller/auth_controller_prefs.dart';
import 'package:pciu_hubspot/features/auth/screens/sign_in_screen.dart';
import 'package:pciu_hubspot/shared/widgets/bottom_nav_bar.dart.dart';

class SplashServices {
  static Future<void> isLogin() async {
    await AuthController.getAccessToken();
    bool isSignIn = AuthController.isSignIn();

    await Future.delayed(const Duration(seconds: 3));

    if (isSignIn) {
      Get.offAll(const MainBottomNavBarScreen());
    } else {
      Get.offAll(const SignInScreen());
    }
  }
}
