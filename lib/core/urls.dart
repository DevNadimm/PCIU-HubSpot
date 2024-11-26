class Urls {
  static const String baseUrl = 'https://pciu-hubspot-server.vercel.app';
  static const String signUp = '$baseUrl/user';
  static const String signIn = '$baseUrl/jwt';

  static String userDetails(String email) {
    return '$baseUrl/user/$email';
  }
}
