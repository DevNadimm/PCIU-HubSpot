import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/controller_binders/controller_binders.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/features/auth/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PCIU-HubSpot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        textTheme: _textTheme,
        inputDecorationTheme: _inputDecorationTheme,
        elevatedButtonTheme: _elevatedButtonThemeData,
      ),
      home: const SplashScreen(),
      initialBinding: ControllerBinders(),
    );
  }

  final TextTheme _textTheme = const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black87,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Colors.black87,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: Colors.black87,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      color: Colors.black87,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      color: Colors.black87,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      color: Colors.black87,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: Colors.black87,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: Colors.black87,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      color: Colors.black87,
      fontSize: 12,
    ),
    labelLarge: TextStyle(
      color: Colors.black87,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      color: Colors.black87,
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  );

  static const OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide.none,
  );

  final InputDecorationTheme _inputDecorationTheme = const InputDecorationTheme(
    filled: true,
    fillColor: shadeColor,
    border: _outlineInputBorder,
    focusedBorder: _outlineInputBorder,
    enabledBorder: _outlineInputBorder,
    hintStyle: TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
  );

  final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
