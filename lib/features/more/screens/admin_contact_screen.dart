import 'package:flutter/material.dart';

class AdminContactScreen extends StatelessWidget {
  const AdminContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact with Admin',
          style: Theme.of(context).textTheme.titleLarge,
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
                'If you had any issues or you liked my concept, please share with me!',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              _buildTextField(
                context: context,
                initialValue: 'Nadim Chowdhury',
                hintText: 'Name',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                context: context,
                initialValue: 'nadimchowdhury87@gmail.com',
                hintText: 'Email',
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
                hintText: 'How can I help you?',
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Send'),
                ),
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
