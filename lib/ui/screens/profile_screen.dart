import 'package:flutter/material.dart';
import 'package:pciu_hubspot/utils/colors.dart';

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
            const SizedBox(height: 6),
            Text(
              'CSE 03308478',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 32),
            _buildStudentInfoContainer(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return const CircleAvatar(
      radius: 65,
      backgroundColor: primaryColor,
      child: CircleAvatar(
        radius: 60,
        backgroundColor: primaryColor,
        backgroundImage: NetworkImage(_profileImageUrl),
      ),
    );
  }

  Widget _buildStudentInfoContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: shadeColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildRow(context, title: 'Email', leading: 'nadim@gmail.com'),
          const SizedBox(height: 8),
          _buildRow(context, title: 'Department', leading: 'CSE'),
          const SizedBox(height: 8),
          _buildRow(context, title: 'Admission', leading: 'Fall 2024'),
          const SizedBox(height: 8),
          _buildRow(context, title: 'Batch', leading: '033'),
          const SizedBox(height: 8),
          _buildRow(context, title: 'Total Credit', leading: '156'),
          const SizedBox(height: 8),
          _buildRow(context, title: 'Shift', leading: 'Day'),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context,
      {required String title, required String leading}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.black.withOpacity(0.6),
                ),
          ),
        ),
        Expanded(
          child: Text(
            ': $leading',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
