import 'package:get/get.dart';
import 'package:pciu_hubspot/core/models/student_model.dart';
import 'package:pciu_hubspot/core/network/network_caller.dart';
import 'package:pciu_hubspot/core/urls.dart';

class SearchStudentController extends GetxController {
  static final instance = Get.find<SearchStudentController>();

  bool _inProgress = false;
  String? _errorMessage;
  int? _totalPages;
  List<Students>? studentList;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  int? get totalPages => _totalPages;

  bool isSuccess = false;

  void setInProgress(bool value) {
    _inProgress = value;
    update();
  }

  Future<bool> getSearchStudent({int? page = 1, String? department = "", String? searchQuery = ""}) async {
    try {
      setInProgress(true);

      final result = await NetworkCaller.getRequest(url: Urls.getSearchStudent(page: page, department: department, searchQuery: searchQuery));
      if (result.isSuccess) {
        _errorMessage = null;
        isSuccess = true;

        final response = StudentModel.fromJson(result.responseData);
        studentList = response.students;
        _totalPages = response.totalPages;
      } else {
        _errorMessage = result.errorMessage;
        isSuccess = false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      isSuccess = false;
    } finally {
      setInProgress(false);
    }
    return isSuccess;
  }
}
