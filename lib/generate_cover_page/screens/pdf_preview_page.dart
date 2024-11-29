import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:open_file/open_file.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';
import 'dart:io';

class PdfPreviewPage extends StatelessWidget {
  final String pdfPath;

  const PdfPreviewPage({
    super.key,
    required this.pdfPath,
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
        child: File(pdfPath).existsSync() ? _viewPdf(context) : _errorMsg(context),
      ),
    );
  }

  Widget _viewPdf(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1 / 1.414,
                  child: PDFView(
                    filePath: pdfPath,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              _openPdf(pdfPath, context);
            },
            child: const Text('Open PDF'),
          ),
        ),
      ],
    );
  }

  Widget _errorMsg(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/empty_data.png", scale: 10),
          const SizedBox(height: 10),
          Text(
            "PDF file not found!",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Future<void> _openPdf(String pdfPath, BuildContext context) async {
    final result = await OpenFile.open(pdfPath);
    if (result.type != ResultType.done) {
      SnackBarMessage.errorMessage("Failed to open the PDF file");
    }
  }
}
