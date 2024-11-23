import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/splash_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplash();
  }

  Future<void> _startSplash() async {
    await SplashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_texure.jpg"),
            fit: BoxFit.cover,
            opacity: 0.05,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/PCIU-HubSpot.png',
                  scale: 4,
                ),
                const SizedBox(height: 20),
                Text("Welcome to PCIU HubSpot!",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: primaryColor)),
                const SizedBox(height: 10),
                Text(
                  "We provide resources and information to students of PCIU, including a student name search, student CGPA, CR info, and officers info.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
