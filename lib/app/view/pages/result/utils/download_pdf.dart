import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> downloadPdf(String url) async {
  if (await Permission.storage.request().isGranted) {
    try {
      final dir = await getExternalStorageDirectory();
      if (dir == null) {
        throw Exception('Unable to get the downloads directory');
      }

      final filePath = '${dir.path}/downloaded_pdf.pdf';

      final dio = Dio();
      await dio.download(url, filePath);

      Fluttertoast.showToast(msg: 'PDF downloaded successfully');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error downloading PDF: $e');
    }
  } else {
    Fluttertoast.showToast(msg: 'Storage permission denied');
  }
}
