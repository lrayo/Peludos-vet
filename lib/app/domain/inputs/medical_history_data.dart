class MedicalHistoryData {
  final DateTime medicalHistoryDate;
  final String reasonForConsultation;
  final String description;
 
  
  MedicalHistoryData({
    required this.medicalHistoryDate,
    required this.reasonForConsultation,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'medicalHistoryDate': medicalHistoryDate.toIso8601String(),
      'reasonForonsultation': reasonForConsultation,
      'description': description,
    };
  }
  
}