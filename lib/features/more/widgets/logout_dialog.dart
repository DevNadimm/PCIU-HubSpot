import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/shared_preferences_controller/auth_controller_prefs.dart';
import 'package:pciu_hubspot/controller/shared_preferences_controller/user_details_controller_prefs.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/features/auth/screens/sign_in_screen.dart';

class LogoutDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.logout,
                  color: Colors.redAccent,
                  size: 50,
                ),
                const SizedBox(height: 15),
                Text(
                  "Log Out",
                  style: Theme.of(context).textTheme.headlineLarge
                ),
                const SizedBox(height: 10),
                Text(
                  "Are you sure you want to log out?",
                  textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black54)
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await AuthController.clearAccessToken();
                          await UserDetailsController.clearUserDetails();
                          Get.offAll(const SignInScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.redAccent,
                        ),
                        child: const Text(
                          "Yes",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: Colors.black87,
                          backgroundColor: shadeColor,
                        ),
                        child: const Text(
                          "No",
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
