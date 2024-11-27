import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';

class MyPopup extends StatelessWidget {
  MyPopup({super.key});

  final TextEditingController _studentIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String get studentId => _studentIdController.text;

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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Student ID',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Please enter your student ID. Format: CSE03308478',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _studentIdController,
                inputFormatters: [_studentIdFormatter],
                maxLength: 11,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Input your Student ID',
                  counterText: "",
                ),
                validator: _validateStudentId,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Get.back(result: _studentIdController.text);
                      } else {
                        SnackBarMessage.errorMessage('Please enter a valid Student ID.');
                      }
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
