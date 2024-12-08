import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/home_controller/officer_controller.dart';
import 'package:pciu_hubspot/core/models/officer_model.dart';
import 'package:pciu_hubspot/core/utils/progress_indicator.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';
import 'package:pciu_hubspot/features/home/widgets/officer_info_card.dart';
import 'package:pciu_hubspot/shared/widgets/empty_list_widget.dart';

class OfficerScreen extends StatefulWidget {
  const OfficerScreen({super.key});

  @override
  State<OfficerScreen> createState() => _OfficerScreenState();
}

class _OfficerScreenState extends State<OfficerScreen> {
  String _searchQuery = '';
  List<Officers> officerList = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final OfficerController officerController = OfficerController.instance;

    final result = await officerController.getOfficers();
    if (result) {
      setState(() {
        officerList = officerController.officerList ?? [];
      });
    } else {
      SnackBarMessage.errorMessage(officerController.errorMessage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = officerList.where((officer) {
      final matchesSearch =
          officer.name!.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Officers',
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<OfficerController>(
          builder: (controller) {
            return Visibility(
              visible: !controller.inProgress,
              replacement: const ProgressIndicatorWidget(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _buildSearchField(context),
                    const SizedBox(height: 16),
                    filteredList.isEmpty
                        ? const EmptyListWidget()
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filteredList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final officer = filteredList[index];
                              return OfficerInfoCard(
                                name: officer.name ?? 'N/A',
                                designation: officer.designation ?? 'N/A',
                                sector: officer.sector ?? 'N/A',
                                contact: officer.contact ?? 'N/A',
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

  Widget _buildSearchField(BuildContext context) {
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
      ],
    );
  }
}
