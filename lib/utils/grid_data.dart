import 'package:flutter/material.dart';
import 'package:pciu_hubspot/data/model/grid_model.dart';
import 'package:pciu_hubspot/ui/screens/under_maintenance_screen.dart';

List<GridModel> servicesList = [
  GridModel(
    const Icon(Icons.emoji_people, size: 50),
    icon: Icons.emoji_people,
    title: "All CRs",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.business_center, size: 50),
    icon: Icons.business_center,
    title: "All Faculties",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.leaderboard, size: 50),
    icon: Icons.leaderboard,
    title: "Batch Coordinators",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.admin_panel_settings, size: 50),
    icon: Icons.admin_panel_settings,
    title: "All Officers",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.person_search, size: 50),
    icon: Icons.person_search,
    title: "Search Students",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.meeting_room, size: 50),
    icon: Icons.meeting_room,
    title: "Empty Room",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.volunteer_activism, size: 50),
    icon: Icons.volunteer_activism,
    title: "Club Members",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.menu_book, size: 50),
    icon: Icons.menu_book,
    title: "Cover Page",
    widget: const UnderMaintenanceScreen(),
  ),
];
