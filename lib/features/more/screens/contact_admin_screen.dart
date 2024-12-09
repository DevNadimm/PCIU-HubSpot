import 'package:flutter/material.dart';

class ContactAdminScreen extends StatefulWidget {
  const ContactAdminScreen({super.key});

  @override
  State<ContactAdminScreen> createState() => _ContactAdminScreenState();
}

class _ContactAdminScreenState extends State<ContactAdminScreen> {
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
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Send Message'),
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
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    String? initialValue,
    String? hintText,
    int maxLines = 1,
  }) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleLarge,
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
