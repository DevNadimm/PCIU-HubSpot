import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/utils/toast_message.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Write a Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Text(
                  "Share Your Experience",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 16),
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

  Widget _buildRatingSection(BuildContext context) {
    return Column(
      children: [
        Text(
          "Rate Us",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  _rating = index + 1.0;
                });
              },
              icon: Icon(
                CupertinoIcons.star_fill,
                color: index < _rating ? Colors.amber : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildReviewTextField() {
    return TextFormField(
      controller: _reviewController,
      maxLines: 5,
      decoration: const InputDecoration(
        hintText: "Write your review here...",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your review";
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _submitReview();
          }
        },
        child: const Text("Submit Review"),
      ),
    );
  }

  void _submitReview() {
    // Submit the review (e.g., send to a server or save locally)
    ToastMessage.successToast('Review submitted successfully');
    _reviewController.clear();
    setState(() {
      _rating = 5;
    });
  }
}
