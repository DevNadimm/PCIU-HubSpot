import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/core/models/menu_option_model.dart';
import 'package:pciu_hubspot/features/more/screens/about_us_screen.dart';
import 'package:pciu_hubspot/features/more/screens/admin_contact_screen.dart';
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
        onTap: () => _navigateToScreen(const AboutUsScreen()),
      ),
      MenuOption(
        title: 'User Reviews',
        subTitle: 'See what our users say about us.',
        imgPath: 'assets/images/rating.png',
        onTap: () => _navigateToScreen(const UserReviewsScreen()),
      ),
      MenuOption(
        title: 'Admin Contact',
        subTitle: 'Reach out for support or feedback.',
        imgPath: 'assets/images/email.png',
        onTap: () => _navigateToScreen(const AdminContactScreen()),
      ),
      MenuOption(
        title: 'Log Out',
        subTitle: 'Securely log out of your account.',
        imgPath: 'assets/images/logout.png',
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
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    option.subTitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
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
              const Icon(Icons.navigate_next_sharp),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
