import 'package:shared_preferences/shared_preferences.dart';

class UserDetailsController {
  static Map<String, dynamic>? userDetails;
  static const String _userDetailsKey = 'user-details';

  static Future<void> saveUserDetails(Map<String, dynamic> details) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userDetailsKey, details.toString());
    userDetails = details;
  }

  static Future<Map<String, dynamic>?> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDetailsString = prefs.getString(_userDetailsKey);

    if (userDetailsString != null) {
      userDetails = Map<String, dynamic>.from(Uri.splitQueryString(userDetailsString));
      return userDetails;
    }

    return null;
  }

  static Future<void> clearUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userDetailsKey);
    userDetails = null;
  }
}