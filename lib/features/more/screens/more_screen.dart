import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildMenuOption(
                title: 'App Theme',
                subTitle: 'Toggle light or dark mode.',
                imgPath: 'assets/images/day-and-night.png',
                isThemeContainer: true,
              ),
              const SizedBox(height: 16),
              _buildMenuOption(
                title: 'About Us',
                subTitle: 'Learn more about our mission and team.',
                imgPath: 'assets/images/team.png',
              ),
              const SizedBox(height: 16),
              _buildMenuOption(
                title: 'User Reviews',
                subTitle: 'See what our users say about us.',
                imgPath: 'assets/images/rating.png',
              ),
              const SizedBox(height: 16),
              _buildMenuOption(
                title: 'Admin Contact',
                subTitle: 'Reach out for support or feedback.',
                imgPath: 'assets/images/email.png',
              ),
              const SizedBox(height: 16),
              _buildMenuOption(
                title: 'Log Out',
                subTitle: 'Securely log out of your account.',
                imgPath: 'assets/images/logout.png',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required String title,
    required String subTitle,
    required String imgPath,
    bool isThemeContainer = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: shadeColor,
      ),
      child: Row(
        children: [
          Image.asset(
            imgPath,
            scale: 10,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const Spacer(),
          isThemeContainer
              ? Switch(
                  value: isDarkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      isDarkTheme = value;
                    });
                  },
                )
              : const Icon(Icons.navigate_next_sharp),
        ],
      ),
    );
  }
}
