import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/auth_controller/auth_controller_prefs.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/core/models/menu_option_model.dart';
import 'package:pciu_hubspot/features/auth/screens/sign_in_screen.dart';
import 'package:pciu_hubspot/features/more/screens/about_us_screen.dart';
import 'package:pciu_hubspot/features/more/screens/contact_admin_screen.dart';
import 'package:pciu_hubspot/features/more/screens/user_reviews_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMenuItems(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItems() {
    final menuOptions = [
      MenuOption(
        title: 'App Theme',
        subTitle: 'Toggle light or dark mode.',
        imgPath: 'assets/images/day-and-night.png',
        isThemeToggle: true,
      ),
      MenuOption(
        title: 'About Us',
        subTitle: 'Learn more about our mission and team.',
        imgPath: 'assets/images/team.png',
        onTap: () => Get.to(const AboutUsScreen()),
      ),
      MenuOption(
        title: 'User Reviews',
        subTitle: 'See what our users say about us.',
        imgPath: 'assets/images/satisfaction.png',
        onTap: () => Get.to(const UserReviewsScreen()),
      ),
      MenuOption(
        title: 'Contact Admin',
        subTitle: 'Reach out for support or feedback.',
        imgPath: 'assets/images/email.png',
        onTap: () => Get.to(const ContactAdminScreen()),
      ),
      MenuOption(
        title: 'Log Out',
        subTitle: 'Securely log out of your account.',
        imgPath: 'assets/images/logout.png',
        onTap: () async {
          await AuthController.clearAccessToken();
          Get.offAll(const SignInScreen());
        }
      ),
    ];

    return Column(
      children: menuOptions.map((option) => _buildMenuOption(option)).toList(),
    );
  }

  Widget _buildMenuOption(MenuOption option) {
    return GestureDetector(
      onTap: option.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: shadeColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(option.imgPath, scale: 12),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    option.subTitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black54),
                  ),
                ],
              ),
            ),
            if (option.isThemeToggle)
              Switch(
                value: isDarkTheme,
                onChanged: (value) => setState(() => isDarkTheme = value),
              )
            else
              const Icon(
                Icons.navigate_next_sharp,
                color: Colors.black54,
              ),
          ],
        ),
      ),
    );
  }
}
