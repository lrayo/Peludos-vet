import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/view/pages/result/utils/fetch_pdf_url.dart';

import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/pages/result/widgets/result%20pdf/pdf_viewer_with_loading_indicator.dart';
// Necesario para permisos de descarga

class CardResultsPdf extends ConsumerWidget {
  const CardResultsPdf({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

    if (arguments == null ||
        !arguments.containsKey('resultID') ||
        !arguments.containsKey('petID')) {
      return Scaffold(
        appBar: AppBar(title: const Text('Result PDF')),
        body: const Center(child: Text('Invalid arguments')),
      );
    }
    final resultID = arguments['resultID']!;
    final petID = arguments['petID']!;
    final sessionController = ref.watch(sessionProvider);
    final user = sessionController.user!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result PDF'),
      ),
      body: FutureBuilder<String?>(
        future: fetchPdfUrl(user.uid, petID, resultID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.white)),
            );
          }
          final pdfUrl = snapshot.data;
          if (pdfUrl == null) {
            return const Center(
              child:
                  Text('PDF not found', style: TextStyle(color: Colors.white)),
            );
          }
          return PdfViewerWithLoadingIndicator(pdfUrl: pdfUrl);
        },
      ),
    );
  }
}
