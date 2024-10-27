import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildSectionHeader(context, 'About PCIU HubSpot'),
            const SizedBox(height: 16),
            Text(
              'The project aims to provide resources and information to students of PCIU, including a student name search, student CGPA, CR info, and officers info.',
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 32),
            _buildSectionHeader(context, 'Our Mission'),
            const SizedBox(height: 16),
            Text(
              'Our mission is to centralize resources and make it easier for students to access important information, connect with their peers, and stay informed about academic progress.',
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 32),
            _buildSectionHeader(context, 'Meet Our Team'),
            const SizedBox(height: 16),
            _buildTeamMember(
              context: context,
              imgPath: 'assets/images/member1.png',
              name: 'Younus Foysal',
              role: 'Project Leader',
            ),
            const SizedBox(height: 16),
            _buildTeamMember(
              context: context,
              imgPath: 'assets/images/member2.jpg',
              name: 'Nadim Chowdhury',
              role: 'Flutter Developer',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(title, style: Theme.of(context).textTheme.headlineSmall);
  }

  Widget _buildTeamMember(
      {required BuildContext context,
      required String imgPath,
      required String name,
      required String role}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(imgPath),
          backgroundColor: primaryColor,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              role,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}
