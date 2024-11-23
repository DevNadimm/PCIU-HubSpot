import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/batch_coordinators_data.dart';
import 'package:pciu_hubspot/features/home/widgets/batch_coordinator_info_card.dart';
import 'package:pciu_hubspot/shared/widgets/dropdown_menu_widget.dart';
import 'package:pciu_hubspot/shared/widgets/empty_list_widget.dart';

class BatchCoordinatorsScreen extends StatefulWidget {
  const BatchCoordinatorsScreen({super.key});

  @override
  State<BatchCoordinatorsScreen> createState() =>
      _BatchCoordinatorsScreenState();
}

class _BatchCoordinatorsScreenState extends State<BatchCoordinatorsScreen> {
  final List<String> _departments = ['CSE', 'EEE', 'ENG'];
  String? _selectedDepartment;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredList = batchCoordinators.where((batchCoordinator) {
      final matchesDepartment = _selectedDepartment == null ||
          batchCoordinator.department == _selectedDepartment;
      final matchesSearch = batchCoordinator.name
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
      return matchesDepartment && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Batch Coordinators',
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
              filteredList.isEmpty
                  ? const EmptyListWidget()
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final batchCoordinator = filteredList[index];
                        return BatchCoordinatorInfoCard(
                          name: batchCoordinator.name,
                          shortName: batchCoordinator.shortForm,
                          room: batchCoordinator.room,
                          department: batchCoordinator.department,
                          contact: batchCoordinator.contact,
                          batches: batchCoordinator.batches,
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
