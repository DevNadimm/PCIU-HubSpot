import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

class PdfPreviewPage extends StatelessWidget {
  final String pdfPath;
  final String text;

  const PdfPreviewPage({
    super.key,
    required this.pdfPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PDF Preview',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Display the PDF preview
            Expanded(
              child: File(pdfPath).existsSync()
                  ? Container(
                      padding: const EdgeInsets.all(5),
                      color: Colors.black26,
                      child: PDFView(
                        filePath: pdfPath,
                      ),
                    )
                  : const Center(child: Text("Error: PDF file not found")),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _downloadPdf(pdfPath, context);
                },
                child: const Text('Open PDF'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to open the PDF
  Future<void> _downloadPdf(String pdfPath, BuildContext context) async {
    final result = await OpenFile.open(pdfPath);
    if (result.type != ResultType.done) {
      // Handle error if file couldn't be opened
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to open the PDF file")),
      );
    }
  }
}
