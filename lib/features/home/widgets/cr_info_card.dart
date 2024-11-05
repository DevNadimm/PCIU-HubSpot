import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';

class CrInfoCard extends StatelessWidget {
  const CrInfoCard({
    super.key,
    required this.name,
    required this.shortName,
    required this.designation,
    required this.room,
    required this.department,
    required this.contact,
  });

  final String name;
  final String shortName;
  final String designation;
  final String room;
  final String department;
  final String contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: shadeColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleSection(
            context: context,
            name: name,
            shortName: shortName,
            designation: designation,
          ),
          const Divider(color: Colors.black26),
          const SizedBox(height: 8),
          _detailRow(context: context, label: 'Room:', value: room),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Department:', value: department),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Contact:', value: contact),
        ],
      ),
    );
  }
}

Widget _titleSection({
  required BuildContext context,
  required String name,
  required String shortName,
  required String designation,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$name ($shortName)',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      const SizedBox(height: 4),
      Text(
        designation,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.black54),
      ),
    ],
  );
}

Widget _detailRow(
    {required BuildContext context,
      required String label,
      required String value}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.black54),
      ),
      Text(
        value,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    ],
  );
}
