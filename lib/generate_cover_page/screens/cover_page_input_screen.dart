import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pciu_hubspot/controller/shared_preferences_controller/user_details_controller_prefs.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/core/utils/progress_indicator.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';
import 'package:pciu_hubspot/generate_cover_page/widgets/pdf_content_widget.dart';
import 'package:pciu_hubspot/shared/widgets/dropdown_menu_widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'pdf_preview_page.dart';

class CoverPageInputScreen extends StatefulWidget {
  const CoverPageInputScreen({super.key});

  @override
  State<CoverPageInputScreen> createState() => _CoverPageInputScreenState();
}

class _CoverPageInputScreenState extends State<CoverPageInputScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _coverPageTypes = const ['Assignment', 'Lab Report'];
  final TextEditingController _courseCodeTEController = TextEditingController();
  final TextEditingController _courseNameTEController = TextEditingController();
  final TextEditingController _assignmentNameTEController = TextEditingController();
  final TextEditingController _expNoTEController = TextEditingController();
  final TextEditingController _expNameTEController = TextEditingController();
  final TextEditingController _teacherNameTEController = TextEditingController();
  final TextEditingController _teacherDepartmentTEController = TextEditingController();
  final TextEditingController _studentNameTEController = TextEditingController();
  final TextEditingController _programTEController = TextEditingController();
  final TextEditingController _batchNoTEController = TextEditingController();
  final TextEditingController _studentIdTEController = TextEditingController();

  String? _selectedCoverPageType;
  String? _selectedDate;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
    _selectedCoverPageType = _coverPageTypes[0];
    _selectedDate = DateFormat('dd MMM yyyy').format(DateTime.now());
  }

  Future<void> _loadUserDetails() async {
    final userDetails = UserDetailsController.userDetails;

    if (userDetails != null) {
      _studentNameTEController.text = userDetails['studentName'] ?? '';
      _programTEController.text = userDetails['studentProgram'] ?? '';
      _studentIdTEController.text = userDetails['studentId'] ?? '';
      _batchNoTEController.text = userDetails['studentBatch'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Generate Cover Page',
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildDropdownField(context, 'Cover Page Type')),
                    const SizedBox(width: 8),
                    Expanded(child: _buildTextField(context, 'Course Code', _courseCodeTEController)),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTextField(context, 'Course Name', _courseNameTEController),
                const SizedBox(height: 16),
                if (_selectedCoverPageType == _coverPageTypes[0])
                  _buildTextField(context, 'Assignment Name', _assignmentNameTEController),
                if (_selectedCoverPageType == _coverPageTypes[1])
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildTextField(context, 'Experiment No', _expNoTEController)),
                      const SizedBox(width: 8),
                      Expanded(child: _buildTextField(context, 'Experiment Name', _expNameTEController)),
                    ],
                  ),
                const SizedBox(height: 16),
                const _SectionHeader(title: 'Faculty Information'),
                const SizedBox(height: 16),
                _buildTextField(context, 'Teacher Name', _teacherNameTEController),
                const SizedBox(height: 16),
                _buildTextField(context, 'Department', _teacherDepartmentTEController),
                const SizedBox(height: 16),
                const _SectionHeader(title: 'Student Information'),
                const SizedBox(height: 16),
                _buildTextField(context, 'Student Name', _studentNameTEController),
                const SizedBox(height: 16),
                _buildTextField(context, 'Program', _programTEController),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildTextField(context, 'Batch No', _batchNoTEController)),
                    const SizedBox(width: 8),
                    Expanded(child: _buildTextField(context, 'Student ID', _studentIdTEController)),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: selectDate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: shadeColor,
                      foregroundColor: Colors.black54,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.calendar),
                        SizedBox(width: 8),
                        Text('Select Date'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                if (_selectedDate != null)
                  Text(
                    'Selected Date: $_selectedDate',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                const SizedBox(height: 16),
                Visibility(
                  visible: !_isLoading,
                  replacement: const ProgressIndicatorWidget(),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: onPressedGeneratePDF,
                      child: const Text('Generate PDF'),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        TextFormField(
          style: Theme.of(context).textTheme.titleLarge,
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDropdownField(BuildContext context, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        DropdownMenuWidget<String>(
          items: _coverPageTypes,
          hintText: label,
          value: _selectedCoverPageType,
          onChanged: (newValue) {
            setState(() {
              _selectedCoverPageType = newValue;
            });
          },
        ),
      ],
    );
  }

  Future<void> selectDate() async {
    DateTime? selected = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
      initialDate: DateTime.now(),
    );

    if (selected != null) {
      setState(() {
        _selectedDate = DateFormat('dd MMM yyyy').format(selected);
      });
    }
  }

  Future<void> onPressedGeneratePDF() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final img = await rootBundle.load('assets/images/pciu_logo_png.png');
        final imageBytes = img.buffer.asUint8List();
        final imageProvider = pw.MemoryImage(imageBytes);

        final pdf = pw.Document();

        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (context) => PdfContentWidget(
              imageProvider: imageProvider,
              coverPageType: _selectedCoverPageType!,
              assignmentName: _assignmentNameTEController.text,
              experimentNo: _expNoTEController.text,
              experimentName: _expNameTEController.text,
              courseCode: _courseCodeTEController.text,
              courseName: _courseNameTEController.text,
              studentName: _studentNameTEController.text,
              studentProgram: _programTEController.text,
              batchNo: _batchNoTEController.text,
              studentId: _studentIdTEController.text,
              teacherName: _teacherNameTEController.text,
              teacherDepartment: _teacherDepartmentTEController.text,
              selectedDate: _selectedDate!,
            ),
          ),
        );

        final pdfBytes = await pdf.save();

        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/cover_page.pdf';
        final file = File(filePath);

        await file.writeAsBytes(pdfBytes);

        setState(() {
          _isLoading = false;
        });

        Get.to(
          PdfPreviewPage(
            pdfPath: filePath,
          ),
        );
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        SnackBarMessage.errorMessage('Error generating PDF: $e');
      }
    }
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 50, child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(width: 50, child: Divider()),
      ],
    );
  }
}
