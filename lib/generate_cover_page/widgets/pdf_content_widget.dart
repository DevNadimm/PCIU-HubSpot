import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class PdfContentWidget extends pw.StatelessWidget {
  final pw.ImageProvider imageProvider;
  final String coverPageType;
  final String? assignmentName;
  final String? experimentNo;
  final String? experimentName;
  final String courseCode;
  final String courseName;
  final String studentName;
  final String studentProgram;
  final String batchNo;
  final String studentId;
  final String teacherName;
  final String teacherDepartment;
  final String selectedDate;

  PdfContentWidget({
    required this.imageProvider,
    required this.coverPageType,
    this.assignmentName,
    this.experimentNo,
    this.experimentName,
    required this.courseCode,
    required this.courseName,
    required this.studentName,
    required this.studentProgram,
    required this.batchNo,
    required this.studentId,
    required this.teacherName,
    required this.teacherDepartment,
    required this.selectedDate,
  });

  @override
  pw.Widget build(pw.Context context) {
    String title = '';
    String details = '';
    if (coverPageType == 'Assignment') {
      title = "ASSIGNMENT";
      details = "Assignment Name: $assignmentName";
    } else if (coverPageType == 'Lab Report') {
      title = "LAB REPORT";
      details = "Experiment No: $experimentNo\nExperiment Name: $experimentName";
    }

    return pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.center,
      children: [
        pw.Image(imageProvider, height: 100),
        pw.SizedBox(height: 20),
        pw.Divider(),
        pw.SizedBox(height: 10),
        pw.Text(
          "Port City International University",
          style: pw.TextStyle(fontSize: 30, fontWeight: pw.FontWeight.bold),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 10),
        pw.Divider(),
        pw.SizedBox(height: 20),
        pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 25,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.deepPurple,
          ),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 20),
        pw.Text(
          details,
          style: pw.TextStyle(fontSize: 17, fontWeight: pw.FontWeight.normal),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          "Course Code: $courseCode",
          style: const pw.TextStyle(fontSize: 17),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          "Course Name: $courseName",
          style: const pw.TextStyle(fontSize: 17),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          "Date: $selectedDate",
          style: const pw.TextStyle(fontSize: 17),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 50),

        pw.Text(
          "Submitted To:",
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          "Name: $teacherName",
          style: const pw.TextStyle(fontSize: 16),
        ),
        pw.Text(
          "Department: $teacherDepartment",
          style: const pw.TextStyle(fontSize: 16),
        ),
        pw.Text(
          "Port City International University",
          style: const pw.TextStyle(fontSize: 16),
        ),
        pw.SizedBox(height: 20),

        pw.Text(
          "Submitted By:",
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          "Name: $studentName",
          style: const pw.TextStyle(fontSize: 16),
        ),
        pw.Text(
          "Program: $studentProgram",
          style: const pw.TextStyle(fontSize: 16),
        ),
        pw.Text(
          "Batch No: $batchNo",
          style: const pw.TextStyle(fontSize: 16),
        ),
        pw.Text(
          "Student ID: $studentId",
          style: const pw.TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
