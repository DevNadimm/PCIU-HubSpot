import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/home_controller/search_student_controller.dart';
import 'package:pciu_hubspot/core/models/student_model.dart';
import 'package:pciu_hubspot/core/utils/progress_indicator.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';
import 'package:pciu_hubspot/features/home/widgets/search_student_card.dart';
import 'package:pciu_hubspot/shared/widgets/dropdown_menu_widget.dart';
import 'package:pciu_hubspot/shared/widgets/empty_list_widget.dart';

class SearchStudentScreen extends StatefulWidget {
  const SearchStudentScreen({super.key});

  @override
  State<SearchStudentScreen> createState() => _SearchStudentScreenState();
}

class _SearchStudentScreenState extends State<SearchStudentScreen> {
  List<Students> studentList = [];
  final List<String> _departments = [
    'CSE',
    'EEE',
    'ENG',
    'BBA',
    'CEN',
    'LLB',
    'BTE'
  ];
  String? _selectedDepartment;
  final TextEditingController _searchController = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  bool hasMoreData = true;
  int page = 1;

  @override
  void initState() {
    super.initState();
    fetchData();
    _initializeScrollListener();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _initializeScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !isLoading &&
          hasMoreData) {
        page++;
        fetchData(
            searchQuery: _searchController.text,
            department: _selectedDepartment);
      }
    });
  }

  void fetchData({String searchQuery = '', String? department}) async {
    final controller = SearchStudentController.instance;

    if (searchQuery != _searchController.text ||
        department != _selectedDepartment) {
      setState(() {
        page = 1;
        studentList.clear();
        isLoading = true;
      });
    }

    final result = await controller.getSearchStudent(
        searchQuery: searchQuery, department: department, page: page);
    if (result) {
      setState(() {
        studentList.addAll(controller.studentList ?? []);
        hasMoreData = controller.totalPages! > page;
        debugPrint("Length Student List:${studentList.length}");
      });
    } else {
      SnackBarMessage.errorMessage(controller.errorMessage!);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Student',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GetBuilder<SearchStudentController>(builder: (controller) {
          return Visibility(
            visible: !controller.inProgress,
            replacement: const ProgressIndicatorWidget(),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  _buildTopSection(context),
                  const SizedBox(height: 16),
                  studentList.isEmpty
                      ? const EmptyListWidget()
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: studentList.length + (isLoading ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == studentList.length) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            final student = studentList[index];
                            return StudentInfoCard(student: student);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 16);
                          },
                        ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            controller: _searchController,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: const InputDecoration(hintText: 'Search by Name'),
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (value) {
              setState(() {
                page = 1;
                studentList.clear();
              });
              fetchData(searchQuery: value, department: _selectedDepartment);
            },
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: DropdownMenuWidget<String>(
            items: _departments,
            hintText: 'Department',
            value: _selectedDepartment,
            onChanged: (newValue) {
              setState(() {
                _selectedDepartment = newValue;
                page = 1;
                studentList.clear();
              });
              fetchData(
                searchQuery: _searchController.text,
                department: _selectedDepartment,
              );
            },
          ),
        ),
      ],
    );
  }
}
