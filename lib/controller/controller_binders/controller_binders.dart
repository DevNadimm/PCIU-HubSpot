import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/auth_controller/google_sign_in_controller.dart';
import 'package:pciu_hubspot/controller/auth_controller/sign_in_controller.dart';
import 'package:pciu_hubspot/controller/home_controller/batch_coordinator_controller.dart';
import 'package:pciu_hubspot/controller/home_controller/cr_controller.dart';
import 'package:pciu_hubspot/controller/home_controller/empty_room_controller.dart';
import 'package:pciu_hubspot/controller/home_controller/faculty_controller.dart';
import 'package:pciu_hubspot/controller/home_controller/officer_controller.dart';
import 'package:pciu_hubspot/controller/home_controller/search_student_controller.dart';
import 'package:pciu_hubspot/controller/home_controller/student_details_controller.dart';
import 'package:pciu_hubspot/controller/more_controller/contact_admin_controller.dart';
import 'package:pciu_hubspot/controller/more_controller/review_controller.dart';
import 'package:pciu_hubspot/controller/more_controller/write_review_controller.dart';
import 'package:pciu_hubspot/controller/network_controller/network_controller.dart';
import '../auth_controller/sign_up_controller.dart';

class ControllerBinders extends Bindings{
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.put(NetworkController());
    Get.put(GoogleSignInController());
    Get.put(StudentDetailsController());
    Get.put(FacultyController());
    Get.put(BatchCoordinatorController());
    Get.put(OfficerController());
    Get.put(ReviewController());
    Get.put(CRController());
    Get.put(EmptyRoomController());
    Get.put(ContactAdminController());
    Get.put(WriteReviewController());
    Get.put(SearchStudentController());
  }
}