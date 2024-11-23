import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? authToken;
  static const String _tokenKey = 'access-token';

  static Future<void> saveAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_tokenKey, token);
    authToken = token;
  }

  static Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString(_tokenKey);
    return authToken;
  }

  static Future<void> clearAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    authToken = null;
  }

  static bool isSignIn() => authToken != null;
}
