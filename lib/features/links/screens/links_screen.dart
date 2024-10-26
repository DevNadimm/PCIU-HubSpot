import 'package:flutter/material.dart';
import 'package:pciu_hubspot/shared/widgets/grid_container.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/core/constants/grid_data.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineLarge,
                  children: [
                    const TextSpan(text: '🔗 Necessary Links\n'),
                    TextSpan(
                      text: 'Visit your required links in one click',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GridContainer(items: necessaryLinks),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
