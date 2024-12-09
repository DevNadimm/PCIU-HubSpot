import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/home_controller/cr_controller.dart';
import 'package:pciu_hubspot/core/models/cr_model.dart';
import 'package:pciu_hubspot/core/utils/progress_indicator.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';
import 'package:pciu_hubspot/features/home/widgets/cr_info_card.dart';
import 'package:pciu_hubspot/shared/widgets/dropdown_menu_widget.dart';
import 'package:pciu_hubspot/shared/widgets/empty_list_widget.dart';

class CrScreen extends StatefulWidget {
  const CrScreen({super.key});

  @override
  State<CrScreen> createState() => _CrScreenState();
}

class _CrScreenState extends State<CrScreen> {
  List<Crs> crList = [];
  final List<String> _departments = ['CSE', 'EEE', 'ENG', 'BBA', 'CEN', 'LLB', 'BTE'];
  String? _selectedDepartment;
  String _searchQuery = '';

  @override
  void initState() {
    fetchData ();
    super.initState();
  }

  void fetchData () async {
    final controller = CRController.instance;

    final result = await controller.getAllCr();
    if(result){
      setState(() {
        crList = controller.crList ?? [];
      });
    } else {
      SnackBarMessage.errorMessage(controller.errorMessage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = crList.where((cr) {
      final matchesDepartment = _selectedDepartment == null || cr.department == _selectedDepartment;
      final matchesSearch = cr.crname!.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesDepartment && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Class Representatives',
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
        child: GetBuilder<CRController>(
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
                              final cr = filteredList[index];
                              return CrInfoCard(
                                cr: cr,
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
