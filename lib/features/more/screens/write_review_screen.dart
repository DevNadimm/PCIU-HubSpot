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
  void dispose() {
    _reviewController.dispose();
    super.dispose();
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
                  _rating = index + 1.0;
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
    ToastMessage.successToast('Review submitted successfully');
    _reviewController.clear();
    setState(() {
      _rating = 5;
    });
  }
}
