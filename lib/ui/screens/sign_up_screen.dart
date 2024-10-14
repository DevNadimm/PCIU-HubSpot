import 'package:flutter/material.dart';
import 'package:pciu_hubspot/ui/screens/sign_in_screen.dart';
import 'package:pciu_hubspot/utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _studentIdTEController = TextEditingController();
  final TextEditingController _nameTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryColor,
              secondaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/PCIU-HubSpot.png',
                    scale: 5,
                  ),
                  const SizedBox(height: 10),
                  _buildTextFields(),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>_onTapSignUp(context),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Sign Up',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildBottomSection(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameTEController,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _studentIdTEController,
            decoration: const InputDecoration(hintText: 'CSE 03308478'),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _emailTEController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _passwordTEController,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Have an account?"),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () => _onTapSignIn(context),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onTapSignUp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
    );
  }

  void _onTapSignIn(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
    );
  }
}
