class ResultData {
  final DateTime resultDate;
  final String pdfURL;
  final String examName;
 
  
  ResultData({
    required this.resultDate,
    required this.pdfURL,
    required this.examName,
  });

  Map<String, dynamic> toJson() {
    return {
      'resultDate': resultDate.toIso8601String(),
      'pdfURL': pdfURL,
      'examName': examName,
    };
  }
  
}