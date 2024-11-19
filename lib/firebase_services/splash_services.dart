import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/features/auth/screens/sign_in_screen.dart';
import 'package:pciu_hubspot/shared/widgets/bottom_nav_bar.dart.dart';

class SplashServices {
  void isLogin() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      Timer(
        const Duration(seconds: 3),
        () => Get.offAll(const MainBottomNavBarScreen()),
      );
    } else {
      Timer(
        const Duration(seconds: 3),
        () => Get.offAll(const SignInScreen()),
      );
    }
  }
}
