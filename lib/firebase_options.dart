// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA_ZBAQxG3tQ5W86ArOmyyNFacy6LyXLcY',
    appId: '1:1079420895223:web:42a948718a0c5b1b1ab8f2',
    messagingSenderId: '1079420895223',
    projectId: 'pciuhubspot',
    authDomain: 'pciuhubspot.firebaseapp.com',
    storageBucket: 'pciuhubspot.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBp5cAJnzkCv18t9Xjk0wnC8PZY3_JwrrA',
    appId: '1:1079420895223:android:ff801823c4a905b61ab8f2',
    messagingSenderId: '1079420895223',
    projectId: 'pciuhubspot',
    storageBucket: 'pciuhubspot.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeex8lmCk7UtV6mj2sarVWk_zVp3U1YM4',
    appId: '1:1079420895223:ios:f29a8c53409e70141ab8f2',
    messagingSenderId: '1079420895223',
    projectId: 'pciuhubspot',
    storageBucket: 'pciuhubspot.firebasestorage.app',
    iosClientId: '1079420895223-srsuks5a1ma681gpfrtgd5tt02snuuqa.apps.googleusercontent.com',
    iosBundleId: 'com.example.pciuHubspot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAeex8lmCk7UtV6mj2sarVWk_zVp3U1YM4',
    appId: '1:1079420895223:ios:f29a8c53409e70141ab8f2',
    messagingSenderId: '1079420895223',
    projectId: 'pciuhubspot',
    storageBucket: 'pciuhubspot.firebasestorage.app',
    iosClientId: '1079420895223-srsuks5a1ma681gpfrtgd5tt02snuuqa.apps.googleusercontent.com',
    iosBundleId: 'com.example.pciuHubspot',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA_ZBAQxG3tQ5W86ArOmyyNFacy6LyXLcY',
    appId: '1:1079420895223:web:7dc920f4944a0a0d1ab8f2',
    messagingSenderId: '1079420895223',
    projectId: 'pciuhubspot',
    authDomain: 'pciuhubspot.firebaseapp.com',
    storageBucket: 'pciuhubspot.firebasestorage.app',
  );
}