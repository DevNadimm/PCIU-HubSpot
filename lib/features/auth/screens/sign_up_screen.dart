import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/auth_controller/sign_up_controller.dart';
import 'package:pciu_hubspot/core/utils/progress_indicator.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';
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
  bool _isPasswordVisible = false;

  TextInputFormatter get _studentIdFormatter {
    return FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9]'));
  }

  String? _validateStudentId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Student ID is required';
    } else if (value.length != 11) {
      return 'Student ID must be 11 characters long';
    } else if (!RegExp(r'^[A-Za-z]{3}\d{8}$').hasMatch(value)) {
      return 'Invalid ID format. Example: CSE03308478';
    }
    return null;
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
                      child: GetBuilder<SignUpController>(
                        builder: (controller) {
                          return Visibility(
                            visible: !controller.signUpInProgress,
                            replacement: const ProgressIndicatorWidget(),
                            child: ElevatedButton(
                              onPressed: _onTapSignUp,
                              child: const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text('Sign Up'),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                    const SizedBox(height: 20),
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
            controller: _nameTEController,
            decoration: const InputDecoration(hintText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name cannot be empty';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _studentIdTEController,
            inputFormatters: [_studentIdFormatter],
            decoration: const InputDecoration(hintText: 'CSE 03308478'),
            validator: _validateStudentId,
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _emailTEController,
            decoration: const InputDecoration(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email cannot be empty';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _passwordTEController,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: primaryColor,
                ),
                onPressed: () {
                  _isPasswordVisible = !_isPasswordVisible;
                  setState(() {});
                },
              ),
            ),
            obscureText: !_isPasswordVisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password cannot be empty';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?"),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () => Get.off(const SignInScreen()),
          child: const Text(
            'Sign In',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onTapSignUp() async {
    if(_globalKey.currentState!.validate()){
      final controller = SignUpController.instance;
      final result = await controller.signUp(
        name: _nameTEController.text.trim(),
        studentId: _studentIdTEController.text.trim(),
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text.trim(),
      );

      if (result) {
        SnackBarMessage.successMessage('Account created successfully!');
        Get.off(SignInScreen(
          email: _emailTEController.text.trim(),
        ));
      } else {
        SnackBarMessage.errorMessage(controller.errorMessage!);
      }
    }
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
