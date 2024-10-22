import 'package:flutter/material.dart';
import 'package:pciu_hubspot/utils/colors.dart';

class GridContainer extends StatelessWidget {
  const GridContainer({super.key, required this.items});

  final List items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => item.widget),
            );
          },
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: shadeColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  size: 35,
                ),
                const SizedBox(height: 06),
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
