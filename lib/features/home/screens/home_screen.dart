import 'package:flutter/material.dart';
import 'package:pciu_hubspot/controller/shared_preferences_controller/user_details_controller_prefs.dart';
import 'package:pciu_hubspot/shared/widgets/grid_container.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/core/constants/grid_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static const String defaultPhotoUrl =
      'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg';

  String name = 'N/A';
  String photoUrl = defaultPhotoUrl;

  @override
  void initState() {
    _loadUserDetails();
    super.initState();
  }

  Future<void> _loadUserDetails() async {
    final userDetails = UserDetailsController.userDetails;
    if (userDetails != null) {
      setState(() {
        name = userDetails['studentName'] ?? 'N/A';
        photoUrl = userDetails['photo'] ?? defaultPhotoUrl;
      });
    }
  }

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
              Text(
                'Hi 👋 $name',
                style: Theme.of(context).textTheme.headlineLarge,
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
    return CircleAvatar(
      radius: 33,
      backgroundColor: primaryColor,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: primaryColor,
        backgroundImage: NetworkImage(photoUrl),
        onBackgroundImageError: (_,__){
          setState(() {
            photoUrl = defaultPhotoUrl;
          });
        },
      ),
    );
  }
}
