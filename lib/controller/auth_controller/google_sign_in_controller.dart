import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pciu_hubspot/controller/auth_controller/auth_controller_prefs.dart';
import 'package:pciu_hubspot/core/network/network_caller.dart';
import 'package:pciu_hubspot/core/urls.dart';
import 'package:pciu_hubspot/features/auth/widgets/my_popup.dart';

class GoogleSignInController extends GetxController {
  static final instance = Get.find<GoogleSignInController>();

  bool _googleSignInInProgress = false;
  bool get googleSignInInProgress => _googleSignInInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool isSuccess = false;

  void setGoogleSignInInProgress(bool value) {
    _googleSignInInProgress = value;
    update();
  }

  Future<bool> signInWithGoogle() async {
    setGoogleSignInInProgress(true);
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return _handleSignInError('You canceled the sign-in process.');
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        return _handleSignInError('Unable to retrieve Google credentials. Please try again.');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user == null) {
        return _handleSignInError('Could not find your account in our system. Please try again.');
      }

      final response = await NetworkCaller.getRequest(url: Urls.userDetails(user.email!));

      if (response.isSuccess) {
        final data = response.responseData;

        if (data.containsKey('data') && data['data'] == 'UserNotFound') {
          return await _handleUserNotFound(user);
        } else {
          return await _signInUser(user.email!, user.uid);
        }
      } else {
        return _handleSignInError('We encountered an issue while fetching your details. Please try again.');
      }
    } catch (e) {
      return _handleSignInError('An error occurred during the sign-in process. Please try again.');
    }
  }

  Future<bool> _handleSignInError(String message) async {
    isSuccess = false;
    _errorMessage = message;
    setGoogleSignInInProgress(false);
    return false;
  }

  Future<bool> _handleUserNotFound(User user) async {
    setGoogleSignInInProgress(false);

    final studentId = await Get.dialog(MyPopup());

    setGoogleSignInInProgress(true);

    if (studentId != null && studentId.isNotEmpty) {
      return await _signUpUser(
        name: user.displayName ?? '',
        studentId: studentId,
        email: user.email!,
        password: user.uid,
        photo: user.photoURL ?? '',
      ) && await _signInUser(user.email!, user.uid);
    } else {
      return _handleSignInError('You must provide a valid student ID to proceed.');
    }
  }

  Future<bool> _signInUser(String email, String uid) async {
    Map<String, dynamic> requestBody = {
      "identifier": email,
      "password": uid,
    };

    try {
      final response = await NetworkCaller.postRequest(
        url: Urls.signIn,
        body: requestBody,
      );

      if (response.isSuccess) {
        final data = response.responseData;
        if (data.containsKey('token')) {
          final token = data['token'];
          await AuthController.saveAccessToken(token);
          setGoogleSignInInProgress(false);
        } else {
          return _handleSignInError('We couldn’t find your authentication token. Please try again.');
        }
      } else {
        return _handleSignInError('Your sign-in attempt was unsuccessful. Please check your credentials and try again.');
      }
    } catch (e) {
      return _handleSignInError('An error occurred. Please try again later.');
    }

    return true;
  }

  Future<bool> _signUpUser({
    required String name,
    required String studentId,
    required String email,
    required String password,
    required String photo,
  }) async {
    Map<String, dynamic> requestBody = {
      "name": name,
      "email": email,
      "password": password,
      "role": "user",
      "sid": studentId,
      "status": true,
      "photo": photo
    };

    try {
      final response = await NetworkCaller.putRequest(
        url: Urls.signUp,
        body: requestBody,
      );

      if (response.isSuccess) {
        _errorMessage = null;
      } else {
        return _handleSignInError('There was an issue with your sign-up information. Please double-check and try again.');
      }
    } catch (e) {
      return _handleSignInError('An unexpected error occurred. Please try again later.');
    }

    return true;
  }
}
