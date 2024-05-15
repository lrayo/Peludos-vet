import 'package:peludos_pet/app/domain/inputs/deworming_data.dart';
import 'package:peludos_pet/app/domain/inputs/medical_history_data.dart';
import 'package:peludos_pet/app/domain/inputs/vac_data.dart';

class PetUpData {
  final String petId;
  final String name;
  final String breed;
  final String age;
  final String weight;
  final String color;
  final String photo;
  final List<VaccinationData> vaccinations;
  final List<DewormingData> dewormings;
  final List<MedicalHistoryData> medicalhistories;

  PetUpData({
    required this.petId,
    required this.name,
    required this.breed,
    required this.age,
    required this.weight,
    required this.photo,
    required this.color,
    this.vaccinations = const [],
    this.dewormings = const [],
    this.medicalhistories = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'petId': petId,
      'name': name,
      'breed': breed,
      'age': age,
      'weight': weight,
      'photo': photo,
      'color': color,
      'vaccinations': vaccinations.map((v) => v.toJson()).toList(),
      'dewormings': dewormings.map((v) => v.toJson()).toList(),
      'medicalHistory': medicalhistories.map((v) => v.toJson()).toList(),
    };
  }
}
