import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String _profileImageUrl =
      'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            _buildProfilePhoto(),
            const SizedBox(height: 16),
            Text(
              'Nadim Chowdhury',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 4),
            Text(
              'CSE 03308478',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 32),
            _buildStudentInfoContainer(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 65,
          backgroundColor: primaryColor,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: primaryColor,
            backgroundImage: NetworkImage(_profileImageUrl),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {},
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: CircleAvatar(
                backgroundColor: primaryColor,
                radius: 17,
                child: Icon(
                  CupertinoIcons.photo,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStudentInfoContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: shadeColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildRow(context, title: 'Email', label: 'nadim@gmail.com'),
          const SizedBox(height: 8),
          _buildRow(context, title: 'Department', label: 'CSE'),
          const SizedBox(height: 8),
          _buildRow(context, title: 'Admission', label: 'Fall 2024'),
          const SizedBox(height: 8),
          _buildRow(context, title: 'Batch', label: '033'),
          const SizedBox(height: 8),
          _buildRow(context, title: 'Total Credit', label: '156'),
          const SizedBox(height: 8),
          _buildRow(context, title: 'Shift', label: 'Day'),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context,
      {required String title, required String label}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.black54),
          ),
        ),
        Expanded(
          child: Text(
            ': $label',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
