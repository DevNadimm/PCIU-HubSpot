import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/core/models/event_model.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key, required this.event});

  final EventModel event;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    final event = widget.event;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event Details',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.5),
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: 1.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (event.banner != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  event.banner!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade300,
                    child: const Center(child: Text('No Image Available')),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            if (event.name != null)
              Text(
                event.name!,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            if (event.club != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "Organized by: ${event.club}",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
              ),
            const SizedBox(height: 16),
            if (event.topic != null ||
                event.date != null ||
                event.time != null ||
                event.location != null ||
                event.fee != null)
              Card(
                elevation: 0,
                color: primaryColor.withOpacity(0.05),
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.shade400, width: 1.5)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (event.topic != null)
                        _buildDetailRow(
                          title: 'Topic',
                          value: event.topic!,
                        ),
                      if (event.date != null)
                        _buildDetailRow(
                          title: 'Date',
                          value: event.date!,
                        ),
                      if (event.time != null)
                        _buildDetailRow(
                          title: 'Time',
                          value: event.time!,
                        ),
                      if (event.location != null)
                        _buildDetailRow(
                          title: 'Location',
                          value: event.location!,
                        ),
                      if (event.fee != null)
                        _buildDetailRow(
                          title: 'Fee',
                          value: '${event.fee} BDT',
                        ),
                    ],
                  ),
                ),
              ),
            if (event.description != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
