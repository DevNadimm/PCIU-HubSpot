import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/auth_controller/sign_in_controller.dart';
import 'package:pciu_hubspot/core/utils/progress_indicator.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';
import 'package:pciu_hubspot/shared/widgets/bottom_nav_bar.dart.dart';
import 'package:pciu_hubspot/features/auth/screens/sign_up_screen.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, this.email});

  final String? email;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    _emailTEController.text = widget.email ?? '';
    super.initState();
  }

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
                    SizedBox(
                      width: double.infinity,
                      child: GetBuilder<SignInController>(
                        builder: (controller) {
                          return Visibility(
                            visible: !controller.inProgress,
                            replacement: const ProgressIndicatorWidget(),
                            child: ElevatedButton(
                              onPressed: () => _onTapSignInButton(context),
                              child: const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text('Sign In'),
                              ),
                            ),
                          );
                        }
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
          TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _passwordTEController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {
                  _isPasswordVisible = !_isPasswordVisible;
                  setState(() {});
                },
                icon: _isPasswordVisible
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                color: primaryColor,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapGoogleSignIn(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: shadeColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google_icon.png',
              scale: 15,
            ),
            const SizedBox(width: 7),
            Text(
              'Sign In with Google',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: Divider(thickness: 2),
            ),
            SizedBox(width: 5),
            Text('Or'),
            SizedBox(width: 5),
            Expanded(
              child: Divider(thickness: 2),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildGoogleSignInButton(context),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () => Get.off(const SignUpScreen()),
              child: const Text(
                'Sign Up',
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

  Future<void> _onTapSignInButton(BuildContext context) async {
   if(_globalKey.currentState!.validate()){

     final controller = SignInController.instance;
     final result = await controller.signIn(
         email: _emailTEController.text.trim(),
         password: _passwordTEController.text.trim());

     if (result) {
       SnackBarMessage.successMessage('Signed in successfully!');
       Get.off(const MainBottomNavBarScreen());
     } else {
       SnackBarMessage.errorMessage(controller.errorMessage!);
     }
   }
  }

  void _onTapGoogleSignIn(BuildContext context) {
    /// Handle Google sign-in here.
    Get.off(const MainBottomNavBarScreen());
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
