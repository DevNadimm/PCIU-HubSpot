import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pciu_hubspot/controller/shared_preferences_controller/user_details_controller_prefs.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const String defaultPhotoUrl =
      'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg';

  String name = 'N/A';
  String photoUrl = defaultPhotoUrl;
  String email = 'N/A';
  String studentId = 'N/A';
  String department = 'N/A';
  String admission = 'N/A';
  String batch = 'N/A';
  int totalCredit = 0;
  String shift = 'N/A';

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    final userDetails = UserDetailsController.userDetails;
    if (userDetails != null) {
      setState(() {
        name = userDetails['studentName'] ?? 'N/A';
        email = userDetails['email'] ?? 'N/A';
        studentId = userDetails['studentId'] ?? 'N/A';
        department = userDetails['studentProgram'] ?? 'N/A';
        admission = userDetails['studentSession'] ?? 'N/A';
        batch = userDetails['studentBatch'] ?? 'N/A';
        totalCredit = userDetails['totalCredit'] ?? 0;
        shift = userDetails['shift'] ?? 'N/A';
        photoUrl = userDetails['photo'] ?? defaultPhotoUrl;
      });
    }
  }

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
              name,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              studentId,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 32),
            _buildStudentInfoContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 65,
          backgroundColor: primaryColor,
          child: CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(photoUrl),
            onBackgroundImageError: (_, __) {
              setState(() {
                photoUrl = defaultPhotoUrl;
              });
            },
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              /// Add functionality here
            },
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

  Widget _buildStudentInfoContainer() {
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
          _buildRow(title: 'Department', label: department),
          const SizedBox(height: 8),
          _buildRow(title: 'Admission', label: admission),
          const SizedBox(height: 8),
          _buildRow(title: 'Batch', label: batch),
          const SizedBox(height: 8),
          _buildRow(title: 'Total Credit', label: '$totalCredit'),
          const SizedBox(height: 8),
          _buildRow(title: 'Shift', label: shift),
        ],
      ),
    );
  }

  Widget _buildRow({required String title, required String label}) {
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
        const Expanded(
          child: Text(':'),
        ),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.end,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
