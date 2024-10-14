import 'package:flutter/material.dart';
import 'package:pciu_hubspot/ui/widgets/grid_container.dart';
import 'package:pciu_hubspot/utils/colors.dart';
import 'package:pciu_hubspot/utils/grid_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildProfilePhoto(),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineLarge,
                  children: const [
                    TextSpan(text: 'Hi 👋 Nadim,\nWelcome to '),
                    TextSpan(
                      text: 'PCIU HubSpot',
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GridContainer(items: servicesList),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return const CircleAvatar(
      radius: 33,
      backgroundColor: primaryColor,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: primaryColor,
        backgroundImage: NetworkImage(
          'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
      ),
    );
  }
}
