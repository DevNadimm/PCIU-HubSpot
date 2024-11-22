import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 50,
        child: LoadingIndicator(
          indicatorType: Indicator.lineScale,
          colors: [primaryColor],
          strokeWidth: 2,
        ),
      ),
    );
  }
}