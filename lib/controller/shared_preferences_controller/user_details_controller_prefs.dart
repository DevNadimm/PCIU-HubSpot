import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetailsController {
  static Map<String, dynamic>? userDetails;
  static const String _userDetailsKey = 'user-details';

  static Future<void> saveUserDetails(Map<String, dynamic> details) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userDetailsKey, jsonEncode(details));
    userDetails = details;
  }

  static Future<Map<String, dynamic>?> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDetailsString = prefs.getString(_userDetailsKey);

    if (userDetailsString != null) {
      try {
        userDetails = jsonDecode(userDetailsString) as Map<String, dynamic>;
        return userDetails;
      } catch (e) {
        debugPrint("Error decoding user details: $e");
        return null;
      }
    }

    return null;
  }

  static Future<void> clearUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userDetailsKey);
    userDetails = null;
  }
}
