import 'package:flutter/cupertino.dart';
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
        name = getFirstTwoWords(userDetails['studentName'] ?? 'N/A');
        photoUrl = userDetails['photo'] ?? defaultPhotoUrl;
      });
    }
  }

  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour >= 4 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 16) {
      return 'Good Afternoon';
    } else if (hour >= 16 && hour < 20) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: primaryColor,
                backgroundImage: NetworkImage(photoUrl),
                onBackgroundImageError: (_, __) {
                  setState(() {
                    photoUrl = defaultPhotoUrl;
                  });
                },
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${getGreetingMessage()} 👋',
                    style: const TextStyle(
                      color: Color(0XFF696969),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.bell),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
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
                GridContainer(items: servicesList),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getFirstTwoWords(String fullName) {
    List<String> words = fullName.split(' ');
    if (words.length >= 2) {
      return '${words[0]} ${words[1]}';
    } else {
      return fullName;
    }
  }
}
