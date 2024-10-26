import 'dart:ui';

class MenuOption {
  final String title;
  final String subTitle;
  final String imgPath;
  final VoidCallback? onTap;
  final bool isThemeToggle;

  MenuOption({
    required this.title,
    required this.subTitle,
    required this.imgPath,
    this.onTap,
    this.isThemeToggle = false,
  });
}