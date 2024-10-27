import 'package:flutter/material.dart';

class AdminContactScreen extends StatelessWidget {
  const AdminContactScreen({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'We’d love to hear from you! If you have feedback or questions, feel free to reach out.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              _buildTextField(
                context: context,
                initialValue: 'Nadim Chowdhury',
                hintText: 'Your Name',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                context: context,
                initialValue: 'nadimchowdhury87@gmail.com',
                hintText: 'Your Email',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                context: context,
                hintText: 'Subject',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                context: context,
                maxLines: 4,
                hintText: 'Please share your message here',
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Send Message'),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'We’ll reply to the email address you provided.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    String? initialValue,
    String? hintText,
    int maxLines = 1,
  }) {
    return TextFormField(
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontWeight: FontWeight.w600),
      initialValue: initialValue,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
