import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/core/models/event_model.dart';

class UpcomingEventCard extends StatelessWidget {
  const UpcomingEventCard({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    const TextStyle eventTextStyle = TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );

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
            right: MediaQuery.of(context).size.width * -0.2,
            bottom: MediaQuery.of(context).size.height * -0.05,
            child: Container(
              height: 200,
              width: 200,
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
                Text(
                  event.name ?? "",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined,
                        color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      event.date ?? "",
                      style: eventTextStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      event.time ?? "",
                      style: eventTextStyle,
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
