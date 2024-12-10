import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/more_controller/write_review_controller.dart';
import 'package:pciu_hubspot/controller/shared_preferences_controller/user_details_controller_prefs.dart';
import 'package:pciu_hubspot/core/utils/progress_indicator.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _reviewController = TextEditingController();

  String? studentName;
  String? studentId;
  int _rating = 5;


  @override
  void initState() {
    fetchStudentData();
    super.initState();
  }

  void fetchStudentData() {
    final userDetails = UserDetailsController.userDetails;

    if (userDetails != null) {
      studentName = userDetails['studentName'] ?? '';
      studentId = userDetails['studentId'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _buildTitle(context, "Rate Us!"),
                const SizedBox(height: 16),
                _buildSubTitle(context,
                    "Every feedback matters to us, tell us how your recent experience with our app was."),
                const SizedBox(height: 32),
                _buildRatingSection(context),
                const SizedBox(height: 16),
                _buildReviewTextField(),
                const SizedBox(height: 16),
                _buildSubmitButton(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Write Review",
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
    );
  }

  Widget _buildTitle(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  Widget _buildSubTitle(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }

  Widget _buildRatingSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context, "How was your experience?"),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  _rating = index + 1;
                });
              },
              icon: Icon(
                index < _rating
                    ? CupertinoIcons.star_fill
                    : CupertinoIcons.star,
                color: Colors.amber,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildReviewTextField() {
    return TextFormField(
      style: Theme.of(context).textTheme.titleLarge,
      controller: _reviewController,
      maxLines: 5,
      decoration: const InputDecoration(
        hintText: "Write your comment",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your comment";
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: GetBuilder<WriteReviewController>(
        builder: (controller) {
          return Visibility(
            visible: !controller.inProgress,
            replacement: const ProgressIndicatorWidget(),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                /// API Call
                Map<String, dynamic> requestBody = {
                  "name": studentName,
                  "sid": studentId,
                  "rating": _rating,
                  "review": _reviewController.text
                };

                final result = await controller.writeReview(requestBody);
                  if(result){
                    SnackBarMessage.successMessage("Thank you for your feedback! Your review has been submitted successfully.");
                    _reviewController.clear();
                    setState(() {
                      _rating = 5;
                    });
                  } else {
                    SnackBarMessage.errorMessage(controller.errorMessage!);
                  }
                }
              },
              child: const Text("Submit Review"),
            ),
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
}
