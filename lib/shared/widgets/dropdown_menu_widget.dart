import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownMenuWidget<T> extends StatelessWidget {
  final String? hintText;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;

  const DropdownMenuWidget({
    super.key,
    required this.items,
    required this.onChanged,
    this.hintText,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<T>(
      isDense: true,
      value: value,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      hint: Text(
        hintText ?? '',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.black54),
      ),
      onChanged: onChanged,
      items: items
          .map(
            (item) => DropdownMenuItem<T>(
              value: item,
              child: Text(
                item.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          )
          .toList(),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
