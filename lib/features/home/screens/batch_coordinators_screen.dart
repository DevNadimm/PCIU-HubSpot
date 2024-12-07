import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/home_controller/batch_coordinator_controller.dart';
import 'package:pciu_hubspot/core/models/batch_coordinator_model.dart';
import 'package:pciu_hubspot/core/utils/progress_indicator.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';
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
  List<BatchCoordinator>? batchCoordinatorList = [];
  String? _selectedDepartment;
  String _searchQuery = '';

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final BatchCoordinatorController batchCoordinatorController = BatchCoordinatorController.instance;
    final result = await batchCoordinatorController.getBatchCoordinators();

    if(result){
      setState(() {
        batchCoordinatorList = batchCoordinatorController.batchCoordinatorList;
      });
    } else {
      SnackBarMessage.errorMessage(batchCoordinatorController.errorMessage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = batchCoordinatorList!.where((batchCoordinator) {
      final matchesDepartment = _selectedDepartment == null || batchCoordinator.department == _selectedDepartment;
      final matchesSearch = batchCoordinator.name!.toLowerCase().contains(_searchQuery.toLowerCase());
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
        child: GetBuilder<BatchCoordinatorController>(
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
                    filteredList.isEmpty
                        ? const EmptyListWidget()
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {
                              final batchCoordinator = filteredList[index];
                              return BatchCoordinatorInfoCard(
                                name: batchCoordinator.name ?? 'N/A',
                                shortName: batchCoordinator.sform ?? 'N/A',
                                room: batchCoordinator.room ?? 'N/A',
                                department: batchCoordinator.department ?? 'N/A',
                                contact: batchCoordinator.contact ?? 'N/A',
                                batches: batchCoordinator.batch ?? [],
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
            );
          }
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
