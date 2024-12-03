import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';

class UpcomingEventCard extends StatelessWidget {
  const UpcomingEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryColor, secondaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Colors.white),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 50,
            top: -60,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Positioned(
            right: -60,
            bottom: -20,
            child: Container(
              height: 150,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upcoming Event",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Navigating Your CSE Career Journey with Anisul Islam",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(CupertinoIcons.calendar,
                        color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      "December 15, 2024",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      "2:00 PM - 6:00 PM",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
