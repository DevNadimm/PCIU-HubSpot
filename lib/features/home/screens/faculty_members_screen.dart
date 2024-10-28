import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/faculty_members_data.dart';
import 'package:pciu_hubspot/features/home/widgets/faculty_info_card.dart';

class FacultyMembersScreen extends StatelessWidget {
  const FacultyMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Faculty Members',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: facultyList.length,
                itemBuilder: (context, index) {
                  final faculty = facultyList[index];
                  return FacultyInfoCard(
                    name: faculty.name,
                    shortName: faculty.shortForm,
                    designation: faculty.designation,
                    room: faculty.room,
                    department: faculty.department,
                    contact: faculty.contact,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
