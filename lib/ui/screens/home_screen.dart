import 'package:flutter/material.dart';
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
              const SizedBox(height: 10),
              _buildGrid(),
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
        backgroundColor: shadeColor,
        backgroundImage: NetworkImage(
          'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: servicesList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        final service = servicesList[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> service.widget));
          },
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  service.icon,
                  size: 30,
                ),
                const SizedBox(height: 06),
                Text(
                  service.title,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
