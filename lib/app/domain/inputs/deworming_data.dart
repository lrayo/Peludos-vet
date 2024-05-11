class DewormingData {
  final DateTime dewormingDate;
  final String namedeworming;

  
  DewormingData({
    required this.dewormingDate,
    required this.namedeworming,

  });

  Map<String, dynamic> toJson() {
    return {
      'dewormingDate': dewormingDate.toIso8601String(),
      'namedeworming': namedeworming,

    };
  }
  
}