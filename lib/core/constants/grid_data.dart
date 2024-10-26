import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pciu_hubspot/core/models/grid_model.dart';
import 'package:pciu_hubspot/features/maintenance/screens/under_maintenance_screen.dart';

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


List<GridModel> necessaryLinks = [
  GridModel(
    const Icon(CupertinoIcons.calendar, size: 50),
    icon: CupertinoIcons.calendar,
    title: "Class Schedule",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.library_books, size: 50),
    icon: Icons.library_books,
    title: "Exam Schedule",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.event_note, size: 50),
    icon: Icons.event_note,
    title: "Academic Calendar",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.facebook, size: 50),
    icon: Icons.facebook,
    title: "PCIU FB Page",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.assignment, size: 50),
    icon: Icons.assignment,
    title: "Online Registration",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.assessment, size: 50),
    icon: Icons.assessment,
    title: "Trimester Result",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.assessment, size: 50),
    icon: Icons.assessment,
    title: "Semester Result",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    const Icon(Icons.assessment, size: 50),
    icon: Icons.assessment,
    title: "CGPA Graph",
    widget: const UnderMaintenanceScreen(),
  ),
];
