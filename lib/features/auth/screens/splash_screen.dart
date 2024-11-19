import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    splashServices.isLogin();
    super.initState();
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
            opacity: 0.07,
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
                  "Your go-to hub for staying informed, connected, and empowered. Everything you need to succeed academically and build meaningful connections is here!",                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
