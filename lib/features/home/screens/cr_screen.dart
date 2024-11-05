import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/cr_data.dart';
import 'package:pciu_hubspot/features/home/widgets/cr_info_card.dart';

class CrScreen extends StatefulWidget {
  const CrScreen({super.key});

  @override
  State<CrScreen> createState() => _CrScreenState();
}

class _CrScreenState extends State<CrScreen> {
  final List<String> _departments = ['CSE', 'EEE', 'ENG', 'BBA', 'CEN', 'LLB', 'BTE'];
  String? _selectedDepartment;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredList = crList.where((cr) {
      final matchesDepartment = _selectedDepartment == null || cr.department == _selectedDepartment;
      final matchesSearch = cr.name.toLowerCase().contains(_searchQuery.toLowerCase());
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
