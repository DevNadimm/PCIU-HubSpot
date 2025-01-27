import 'package:pciu_hubspot/core/models/grid_model.dart';
import 'package:pciu_hubspot/features/home/screens/batch_coordinators_screen.dart';
import 'package:pciu_hubspot/features/home/screens/cr_screen.dart';
import 'package:pciu_hubspot/features/home/screens/empty_room_screen.dart';
import 'package:pciu_hubspot/features/home/screens/faculty_members_screen.dart';
import 'package:pciu_hubspot/features/home/screens/officer_screen.dart';
import 'package:pciu_hubspot/features/home/screens/search_student_screen.dart';
import 'package:pciu_hubspot/features/other/screens/under_maintenance_screen.dart';
import 'package:pciu_hubspot/generate_cover_page/screens/cover_page_input_screen.dart';
import 'package:url_launcher/url_launcher.dart';

List<HomeGridModel> servicesList = [
  HomeGridModel(
    imgPath: 'assets/images/services/graduated.png',
    title: "All CRs",
    widget: const CrScreen(),
  ),
  HomeGridModel(
    imgPath: 'assets/images/services/teacher.png',
    title: "All Faculties",
    widget: const FacultyMembersScreen(),
  ),
  HomeGridModel(
    imgPath: 'assets/images/services/batch_coordinator.png',
    title: "Batch Coordinators",
    widget: const BatchCoordinatorsScreen(),
  ),
  HomeGridModel(
    imgPath: 'assets/images/services/workplace.png',
    title: "All Officers",
    widget: const OfficerScreen(),
  ),
  HomeGridModel(
    imgPath: 'assets/images/services/magnifier.png',
    title: "Search Students",
    widget: const SearchStudentScreen(),
  ),
  HomeGridModel(
    imgPath: 'assets/images/services/emptyroom.png',
    title: "Empty Room",
    widget: const EmptyRoomScreen(),
  ),
  HomeGridModel(
    imgPath: 'assets/images/services/clubmembers.png',
    title: "Club Members",
    widget: const UnderMaintenanceScreen(),
  ),
  HomeGridModel(
    imgPath: 'assets/images/services/coverpage.png',
    title: "Cover Page",
    widget: const CoverPageInputScreen(),
  ),
];

List<LinkGridModel> necessaryLinks = [
  LinkGridModel(
    imgPath: 'assets/images/links/class_schedule.png',
    title: "Class Schedule",
    onTap: () => launchURL(
      'https://www.portcity.edu.bd/HomePage/ListPrimary/23/C/academic-class-schedule',
    ),
  ),
  LinkGridModel(
    imgPath: 'assets/images/links/exam_schedule.png',
    title: "Exam Schedule",
    onTap: () => launchURL(
      'https://www.portcity.edu.bd/HomePage/ListPrimary/24/C/academic-exam-schedule',
    ),
  ),
  LinkGridModel(
    imgPath: 'assets/images/links/academic_calendar.png',
    title: "Academic Calendar",
    onTap: () => launchURL(
      'https://www.portcity.edu.bd/HomePage/AcademicCalender',
    ),
  ),
  LinkGridModel(
    imgPath: 'assets/images/links/facebook.png',
    title: "PCIU FB Page",
    onTap: () => launchURL(
      'https://www.facebook.com/profile.php?id=100064572554682',
    ),
  ),
  LinkGridModel(
    imgPath: 'assets/images/links/registration.png',
    title: "Online Registration",
    onTap: () => launchURL(
      'https://studentportal.portcity.edu.bd/',
    ),
  ),
  LinkGridModel(
    imgPath: 'assets/images/links/trimester_result.png',
    title: "Trimester Result",
    onTap: () => launchURL(
      'http://119.18.149.45/PCIUStudentPortal/Student/TrimesterResult',
    ),
  ),
  LinkGridModel(
    imgPath: 'assets/images/links/semester_result.png',
    title: "Semester Result",
    onTap: () => launchURL(
      'http://119.18.149.45/PCIUOnlineResult',
    ),
  ),
  LinkGridModel(
    imgPath: 'assets/images/links/cgpa_graph.png',
    title: "CGPA Graph",
    onTap: () => launchURL(
      'https://pciu-cgpa-calculator.vercel.app/',
    ),
  ),
];

Future<void> launchURL(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
