import 'package:cloud_firestore/cloud_firestore.dart';

Future<String?> fetchPdfUrl(
    String userID, String petID, String resultID) async {
  final userDoc =
      await FirebaseFirestore.instance.collection('users').doc(userID).get();

  if (!userDoc.exists) {
    return null;
  }

  final pets = userDoc.data()?['pets'] as List<dynamic>?;
  if (pets == null) {
    return null;
  }

  for (var pet in pets) {
    if (pet['petId'] == petID) {
      final results = pet['results'] as List<dynamic>?;

      if (results == null) {
        return null;
      }

      for (var result in results) {
        if (result['resultId'] == resultID) {
          return result['pdfURL'] as String?;
        }
      }
    }
  }
  return null;
}
