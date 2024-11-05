import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/core/models/cr_model.dart';

class CrInfoCard extends StatelessWidget {
  const CrInfoCard({
    super.key,
    required this.cr,
  });

  final CR cr;

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
          _titleSection(context: context, name: cr.name),
          const Divider(color: Colors.black26),
          const SizedBox(height: 8),
          _detailRow(context: context, label: 'Batch:', value: cr.batch ?? 'N/A'),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Department:', value: cr.department ?? 'N/A'),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Shift:', value: cr.shift ?? 'N/A'),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Section:', value: cr.section ?? 'N/A'),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Contact:', value: cr.contact ?? 'N/A'),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Email:', value: cr.email ?? 'N/A'),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Facebook ID:', value: cr.facebookId ?? 'N/A'),
        ],
      ),
    );
  }
}

Widget _titleSection({
  required BuildContext context,
  required String name,
}) {
  return Text(
    name,
    style: Theme.of(context).textTheme.headlineSmall,
  );
}

Widget _detailRow({
  required BuildContext context,
  required String label,
  required String value,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54),
      ),
      Text(
        value,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    ],
  );
}
