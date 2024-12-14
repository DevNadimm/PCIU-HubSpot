import 'package:pciu_hubspot/core/models/grid_model.dart';
import 'package:pciu_hubspot/features/home/screens/batch_coordinators_screen.dart';
import 'package:pciu_hubspot/features/home/screens/cr_screen.dart';
import 'package:pciu_hubspot/features/home/screens/empty_room_screen.dart';
import 'package:pciu_hubspot/features/home/screens/faculty_members_screen.dart';
import 'package:pciu_hubspot/features/home/screens/officer_screen.dart';
import 'package:pciu_hubspot/features/links/screens/web_view_screen.dart';
import 'package:pciu_hubspot/features/other/screens/under_maintenance_screen.dart';
import 'package:pciu_hubspot/generate_cover_page/screens/cover_page_input_screen.dart';

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
    widget: const OfficerScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/services/magnifier.png',
    title: "Search Students",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/services/emptyroom.png',
    title: "Empty Room",
    widget: const EmptyRoomScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/services/clubmembers.png',
    title: "Club Members",
    widget: const UnderMaintenanceScreen(),
  ),
  GridModel(
    imgPath: 'assets/images/services/coverpage.png',
    title: "Cover Page",
    widget: const CoverPageInputScreen(),
  ),
];

List<GridModel> necessaryLinks = [
  GridModel(
    imgPath: 'assets/images/links/class_schedule.png',
    title: "Class Schedule",
    widget: const WebViewScreen(
      url: 'https://www.portcity.edu.bd/HomePage/ListPrimary/23/C/academic-class-schedule',
      title: 'Class Schedule',
    ),
  ),
  GridModel(
    imgPath: 'assets/images/links/exam_schedule.png',
    title: "Exam Schedule",
    widget: const WebViewScreen(
      url: 'https://www.portcity.edu.bd/HomePage/ListPrimary/24/C/academic-exam-schedule',
      title: 'Exam Schedule',
    ),
  ),
  GridModel(
    imgPath: 'assets/images/links/academic_calendar.png',
    title: "Academic Calendar",
    widget: const WebViewScreen(
      url: 'https://www.portcity.edu.bd/HomePage/AcademicCalender',
      title: 'Academic Calendar',
    ),
  ),
  GridModel(
    imgPath: 'assets/images/links/facebook.png',
    title: "PCIU FB Page",
    widget: const WebViewScreen(
      url: 'https://www.facebook.com/profile.php?id=100064572554682',
      title: 'PCIU FB Page',
    ),
  ),
  GridModel(
    imgPath: 'assets/images/links/registration.png',
    title: "Online Registration",
    widget: const WebViewScreen(
      url: 'http://119.18.149.45/pciuonlineregistration',
      title: 'Online Registration',
    ),
  ),
  GridModel(
    imgPath: 'assets/images/links/trimester_result.png',
    title: "Trimester Result",
    widget: const WebViewScreen(
      url: 'http://119.18.149.45/PCIUStudentPortal/Student/TrimesterResult',
      title: 'Trimester Result',
    ),
  ),
  GridModel(
    imgPath: 'assets/images/links/semester_result.png',
    title: "Semester Result",
    widget: const WebViewScreen(
      url: 'http://119.18.149.45/PCIUOnlineResult',
      title: 'Semester Result',
    ),
  ),
  GridModel(
    imgPath: 'assets/images/links/cgpa_graph.png',
    title: "CGPA Graph",
    widget: const WebViewScreen(
      url: 'https://pciu-cgpa-calculator.vercel.app/',
      title: 'CGPA Graph',
    ),
  ),
];
