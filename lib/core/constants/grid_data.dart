import 'package:pciu_hubspot/core/models/grid_model.dart';
import 'package:pciu_hubspot/features/home/screens/batch_coordinators_screen.dart';
import 'package:pciu_hubspot/features/home/screens/cr_screen.dart';
import 'package:pciu_hubspot/features/home/screens/faculty_members_screen.dart';
import 'package:pciu_hubspot/features/other/screens/under_maintenance_screen.dart';
import 'package:pciu_hubspot/generate_cover_page/screens/input_screen.dart';

List<GridModel> servicesList = [
  GridModel(
    imgPath: 'assets/images/services/graduated.png',
    title: "All CRs",
    widget: const CrScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/services/teacher.png',
    title: "All Faculties",
    widget: const FacultyMembersScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/services/batch_coordinator.png',
    title: "Batch Coordinators",
    widget: const BatchCoordinatorsScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/services/workplace.png',
    title: "All Officers",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/services/magnifier.png',
    title: "Search Students",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/services/emptyroom.png',
    title: "Empty Room",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/services/clubmembers.png',
    title: "Club Members",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/services/coverpage.png',
    title: "Cover Page",
    widget: const InputScreen(),
  ),
];


List<GridModel> necessaryLinks = [
  GridModel(
    imgPath: 'assets/images/links/class_schedule.png',
    title: "Class Schedule",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/links/exam_schedule.png',
    title: "Exam Schedule",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/links/academic_calendar.png',
    title: "Academic Calendar",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/links/facebook.png',
    title: "PCIU FB Page",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/links/registration.png',
    title: "Online Registration",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/links/trimester_result.png',
    title: "Trimester Result",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/links/semester_result.png',
    title: "Semester Result",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/links/cgpa_graph.png',
    title: "CGPA Graph",
    widget: const UnderMaintenanceScreen(),
  ),
];
