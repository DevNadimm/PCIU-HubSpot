import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/core/models/student_model.dart';

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard({
    super.key,
    required this.student,
  });

  final Students student;

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
          _titleSection(context: context, name: student.studentName ?? 'N/A'),
          const Divider(color: Colors.black26),
          const SizedBox(height: 8),
          _detailRow(context: context, label: 'ID No:', value: student.studentIdNo ?? 'N/A'),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Batch:', value: student.batch ?? 'N/A'),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Department:', value: student.department ?? 'N/A'),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Session:', value: student.studentSession ?? 'N/A'),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Credit Hours:', value: student.crhr?.toString() ?? 'N/A'),
          const SizedBox(height: 4),
          _detailRow(context: context, label: 'Shift:', value: student.shift ?? 'N/A'),
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
      Expanded(
        child: Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.end,
        ),
      ),
    ],
  );
}
