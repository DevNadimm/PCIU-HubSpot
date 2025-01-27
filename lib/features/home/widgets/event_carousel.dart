import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/models/event_model.dart';
import 'package:pciu_hubspot/features/home/widgets/upcoming_event_card.dart';

class EventCarousel extends StatelessWidget {
  const EventCarousel({super.key, required this.eventList});
  final List<EventModel> eventList;

  @override
  Widget build(BuildContext context) {
    if (eventList.isEmpty) {
      return Center(
        child: Text(
          "No upcoming events",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );
    }
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
      items: eventList.map((event) {
        return UpcomingEventCard(event: event);
      }).toList(),
    );
  }
}
