import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 80),
          Image.asset("assets/images/no-data.png", scale: 9),
          const SizedBox(height: 10),
          Text(
            "No Data Found!",
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
