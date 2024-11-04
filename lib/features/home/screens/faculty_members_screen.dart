import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/faculty_members_data.dart';
import 'package:pciu_hubspot/features/home/widgets/faculty_info_card.dart';

class FacultyMembersScreen extends StatefulWidget {
  const FacultyMembersScreen({super.key});

  @override
  State<FacultyMembersScreen> createState() => _FacultyMembersScreenState();
}

class _FacultyMembersScreenState extends State<FacultyMembersScreen> {
  final List<String> _departments = ['CSE', 'EEE', 'ENG'];
  String? _selectedDepartment;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredFacultyList = facultyList.where((faculty) {
      final matchesDepartment = _selectedDepartment == null ||
          faculty.department == _selectedDepartment;
      final matchesSearch =
          faculty.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesDepartment && matchesSearch;
    }).toList();

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
              _buildTopSection(context),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredFacultyList.length,
                itemBuilder: (context, index) {
                  final faculty = filteredFacultyList[index];
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
                  return const SizedBox(height: 16);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            style: Theme.of(context).textTheme.titleLarge,
            decoration: const InputDecoration(hintText: 'Search by Name'),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: DropdownButtonFormField<String>(
            isDense: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(14),
              hintText: 'Department',
            ),
            value: _selectedDepartment,
            onChanged: (newValue) {
              setState(() {
                _selectedDepartment = newValue;
              });
            },
            items: _departments.map((department) {
              return DropdownMenuItem<String>(
                value: department,
                child: Text(department),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
