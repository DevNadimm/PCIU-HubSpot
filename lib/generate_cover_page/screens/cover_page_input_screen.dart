import 'package:flutter/material.dart';
import 'package:pciu_hubspot/shared/widgets/dropdown_menu_widget.dart';

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

  @override
  void initState() {
    _selectedCoverPageType = _coverPageTypes[0];
    super.initState();
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
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // TODO: Implement Generate PDF functionality
                      }
                    },
                    child: const Text('Generate PDF'),
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
