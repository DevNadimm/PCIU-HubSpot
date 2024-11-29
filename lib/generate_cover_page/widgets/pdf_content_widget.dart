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
    pw.Widget detailsWidget = pw.SizedBox();

    if (coverPageType == 'Assignment') {
      title = "ASSIGNMENT";
      detailsWidget = pw.Text(
        "Assignment Name: $assignmentName",
        style: const pw.TextStyle(fontSize: 17),
        textAlign: pw.TextAlign.left,
      );
    } else if (coverPageType == 'Lab Report') {
      title = "LAB REPORT";
      detailsWidget = pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            "Experiment No: $experimentNo",
            style: const pw.TextStyle(fontSize: 17),
            textAlign: pw.TextAlign.left,
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            "Experiment Name: $experimentName",
            style: const pw.TextStyle(fontSize: 17),
            textAlign: pw.TextAlign.left,
          ),
        ],
      );
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
        pw.SizedBox(height: 40),
        pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 25,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.deepPurple,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.SizedBox(height: 40),
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.all(20),
          decoration: pw.BoxDecoration(
            color: PdfColor.fromHex('#f6f3fa'),
            border: pw.Border.all(
              color: PdfColor.fromHex('#B39DDB'),
              width: 2,
            ),
            borderRadius: pw.BorderRadius.circular(15),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              detailsWidget,
              pw.SizedBox(height: 10),
              pw.Text(
                "Course Code: $courseCode",
                style: const pw.TextStyle(fontSize: 17),
                textAlign: pw.TextAlign.left,
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                "Course Name: $courseName",
                style: const pw.TextStyle(fontSize: 17),
                textAlign: pw.TextAlign.left,
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                "Submission Date: $selectedDate",
                style: const pw.TextStyle(fontSize: 17),
                textAlign: pw.TextAlign.left,
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 20),
        pw.Table(
          columnWidths: {
            0: const pw.FlexColumnWidth(1),
            1: const pw.FlexColumnWidth(0.1),
            2: const pw.FlexColumnWidth(1),
          },
          children: [
            pw.TableRow(
              children: [
                _buildTableCell(
                  title: "Submitted To",
                  data: [
                    teacherName,
                    "Department of $teacherDepartment",
                    "Port City International University",
                  ],
                ),
                pw.SizedBox(width: 20),
                _buildTableCell(
                  title: "Submitted By",
                  data: [
                    studentName,
                    "Program: $studentProgram",
                    "Batch No: $batchNo",
                    "Student ID: $studentId",
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildTableCell({
    required String title,
    required List<String> data,
  }) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        color: PdfColor.fromHex('#f6f3fa'),
        border: pw.Border.all(
          color: PdfColor.fromHex('#B39DDB'),
          width: 2,
        ),
        borderRadius: pw.BorderRadius.circular(15),
      ),
      child: pw.Padding(
        padding: const pw.EdgeInsets.all(10),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              title,
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 10),
            for (var item in data)
              pw.Text(
                item,
                style: const pw.TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
