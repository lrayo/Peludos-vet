import 'package:flutter/material.dart';
import 'package:peludos_pet/app/view/global_widget/button_widget.dart';
import 'package:peludos_pet/app/view/pages/result/utils/download_pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerWithLoadingIndicator extends StatefulWidget {
  final String pdfUrl;

  const PdfViewerWithLoadingIndicator({super.key, required this.pdfUrl});

  @override
  PdfViewerWithLoadingIndicatorState createState() =>
      PdfViewerWithLoadingIndicatorState();
}

class PdfViewerWithLoadingIndicatorState
    extends State<PdfViewerWithLoadingIndicator> {
  bool _isLoading = true;
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfPdfViewer.network(
          widget.pdfUrl,
          controller: _pdfViewerController,
          onDocumentLoaded: (details) {
            setState(() {
              _isLoading = false;
            });
          },
          pageLayoutMode: PdfPageLayoutMode.continuous,
          canShowScrollHead: false,
        ),
        if (_isLoading)
          const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
              width: 200,
              child: Button(
                onPressed: () => downloadPdf(widget.pdfUrl),
                text: 'Download PDF',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
