class VaccinationData {
  final DateTime vaccinationDate;
  final String lote;
  final String nameVaccination;
 
  
  VaccinationData({
    required this.vaccinationDate,
    required this.lote,
    required this.nameVaccination,
  });

  Map<String, dynamic> toJson() {
    return {
      'vaccinationDate': vaccinationDate.toIso8601String(),
      'lote': lote,
      'nameVaccination': nameVaccination,
    };
  }
  
}