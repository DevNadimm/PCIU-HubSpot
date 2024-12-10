class Urls {
  static const String baseUrl = 'https://pciu-hubspot-server.vercel.app';
  static const String signUp = '$baseUrl/user';
  static const String signIn = '$baseUrl/jwt';
  static const String emptyRoom = '$baseUrl/emptyroomAPP';
  static const String contactAdmin = '$baseUrl/msg';

  static String userDetails(String email) {
    return '$baseUrl/user/$email';
  }

  static String studentInfo(String studentId) {
    return '$baseUrl/studentAPP/$studentId';
  }

  static String facultyMember() {
    return '$baseUrl/faculties?page=1&limit=50&department&searchQuery';
  }

  static String batchCoordinator () {
    return '$baseUrl/batchcoordinatorAPP';
  }

  static String officers () {
    return '$baseUrl/officersAPP';
  }

  static String getReviews () {
    return '$baseUrl/reviews';
  }

  static String getAllCr () {
    return '$baseUrl/allcrs?page=1&limit=200';
  }
}
