import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pciu_hubspot/app.dart';
import 'package:pciu_hubspot/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
