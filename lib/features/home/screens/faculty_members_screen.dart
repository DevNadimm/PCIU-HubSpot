import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/home_controller/faculty_controller.dart';
import 'package:pciu_hubspot/core/models/faculty_model.dart';
import 'package:pciu_hubspot/core/utils/progress_indicator.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';
import 'package:pciu_hubspot/features/home/widgets/faculty_info_card.dart';
import 'package:pciu_hubspot/shared/widgets/dropdown_menu_widget.dart';
import 'package:pciu_hubspot/shared/widgets/empty_list_widget.dart';

class FacultyMembersScreen extends StatefulWidget {
  const FacultyMembersScreen({super.key});

  @override
  State<FacultyMembersScreen> createState() => _FacultyMembersScreenState();
}

class _FacultyMembersScreenState extends State<FacultyMembersScreen> {
  final List<String> _departments = ['CSE', 'EEE', 'ENG'];
  List<Faculties> facultyList = [];
  String? _selectedDepartment;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final FacultyController facultyController = FacultyController.instance;

    final result = await facultyController.getFacultyMember();
    if (result) {
      setState(() {
        facultyList = facultyController.facultyList ?? [];
      });
    } else {
      SnackBarMessage.errorMessage(facultyController.errorMessage!);
    }
  }


  @override
  Widget build(BuildContext context) {
    final filteredFacultyList = facultyList.where((faculty) {
      final matchesDepartment = _selectedDepartment == null || faculty.department == _selectedDepartment;
      final matchesSearch = faculty.name?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false;
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.5),
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: 1.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GetBuilder<FacultyController>(
          builder: (controller) {
            return Visibility(
              visible: !controller.inProgress,
              replacement: const ProgressIndicatorWidget(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _buildTopSection(context),
                    const SizedBox(height: 16),
                    filteredFacultyList.isEmpty
                        ? const EmptyListWidget()
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filteredFacultyList.length,
                            itemBuilder: (context, index) {
                              final faculty = filteredFacultyList[index];
                              return FacultyInfoCard(
                                name: faculty.name ?? 'N/A',
                                shortName: faculty.sform ?? 'N/A',
                                designation: faculty.designation ?? 'N/A',
                                room: faculty.room ?? 'N/A',
                                department: faculty.department ?? 'N/A',
                                contact: faculty.contact ?? 'N/A',
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 16);
                            },
                          ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
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
          child: DropdownMenuWidget<String>(
            items: _departments,
            hintText: 'Department',
            value: _selectedDepartment,
            onChanged: (newValue) {
              setState(() {
                _selectedDepartment = newValue;
              });
            },
          ),
        ),
      ],
    );
  }
}
