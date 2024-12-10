import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/more_controller/contact_admin_controller.dart';
import 'package:pciu_hubspot/controller/shared_preferences_controller/user_details_controller_prefs.dart';
import 'package:pciu_hubspot/core/utils/progress_indicator.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';

class ContactAdminScreen extends StatefulWidget {
  const ContactAdminScreen({super.key});

  @override
  State<ContactAdminScreen> createState() => _ContactAdminScreenState();
}

class _ContactAdminScreenState extends State<ContactAdminScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _subjectTEController = TextEditingController();
  final TextEditingController _messageTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  void initState() {
    fetchStudentData();
    super.initState();
  }

  void fetchStudentData() {
    final userDetails = UserDetailsController.userDetails;

    if (userDetails != null) {
      _nameTEController.text = userDetails['studentName'] ?? '';
      _emailTEController.text = userDetails['email'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Admin',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.5),
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: 1.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  'We’d love to hear from you! If you have feedback or questions, feel free to reach out.',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 32),
                _buildTextField(
                  controller: _nameTEController,
                  context: context,
                  hintText: 'Your Name',
                  level: 'your name',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _emailTEController,
                  context: context,
                  hintText: 'Your Email',
                  level: 'your email',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _subjectTEController,
                  context: context,
                  hintText: 'Subject',
                  level: 'subject',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _messageTEController,
                  context: context,
                  maxLines: 4,
                  hintText: 'Please share your message here',
                  level: 'your message',
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: GetBuilder<ContactAdminController>(
                    builder: (controller) {
                      return Visibility(
                        visible: !controller.inProgress,
                        replacement: const ProgressIndicatorWidget(),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_globalKey.currentState!.validate()) {
                            /// API Call
                            final requestBody = {
                              "name": _nameTEController.text,
                              "email": _emailTEController.text,
                              "subject": _subjectTEController.text,
                              "msgdata":_messageTEController.text,
                            };

                            final result = await controller.sendMessage(requestBody);
                              if(result){
                                SnackBarMessage.successMessage("Message sent! Thank you for reaching out.");
                                _subjectTEController.clear();
                                _messageTEController.clear();
                              } else {
                                SnackBarMessage.errorMessage(controller.errorMessage!);
                              }
                            }
                          },
                          child: const Text('Send Message'),
                        ),
                      );
                    }
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'We’ll reply to the email address you provided.',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String level,
    required BuildContext context,
    required TextEditingController controller,
    String? hintText,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.titleLarge,
      maxLines: maxLines,
      decoration: InputDecoration(hintText: hintText),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $level";
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _emailTEController.dispose();
    _subjectTEController.dispose();
    _messageTEController.dispose();
    super.dispose();
  }
}
