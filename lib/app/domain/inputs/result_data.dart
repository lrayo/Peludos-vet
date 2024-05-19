class ResultData {
  final String resultId;
  final DateTime resultDate;
  final String pdfURL;
  final String examName;
 
  
  ResultData({
    required this.resultId, 
    required this.resultDate,
    required this.pdfURL,
    required this.examName,
  });

  Map<String, dynamic> toJson() {
    return {
      'resultId': resultId,
      'resultDate': resultDate.toIso8601String(),
      'pdfURL': pdfURL,
      'examName': examName,
    };
  }
  
}