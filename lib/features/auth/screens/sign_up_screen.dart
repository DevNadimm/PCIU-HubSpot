import 'package:flutter/material.dart';
import 'package:pciu_hubspot/features/auth/screens/sign_in_screen.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';

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
            colors: [primaryColor, secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
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
                    Visibility(
                      visible: !_isLoading,
                      replacement: const CircularProgressIndicator(),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _onTapSignUp,
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Sign Up'),
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
      ),
    );
  }

  Widget _buildTextFields() {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          _buildTextField(
            controller: _nameTEController,
            hintText: 'Name',
          ),
          const SizedBox(height: 10),
          _buildTextField(
            controller: _studentIdTEController,
            hintText: 'CSE 03308478',
          ),
          const SizedBox(height: 10),
          _buildTextField(
            controller: _emailTEController,
            hintText: 'Email',
          ),
          const SizedBox(height: 10),
          _buildTextField(
            controller: _passwordTEController,
            hintText: 'Password',
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller, required String hintText}) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleLarge,
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
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

  Future<void> _onTapSignUp() async {
    _isLoading = true;
    setState(() {});

    if (_globalKey.currentState?.validate() ?? false) {
      final email = _emailTEController.text.trim();
      final password = _passwordTEController.text.trim();

      try {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        SnackBarMessage.successMessage('Account created successfully!');
        await Future.delayed(const Duration(seconds: 2));
        Get.off(const SignInScreen());
      } catch (e) {
        SnackBarMessage.errorMessage('Sign Up Failed');
      }
    }

    _isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _studentIdTEController.dispose();
    _nameTEController.dispose();
    super.dispose();
  }
}
