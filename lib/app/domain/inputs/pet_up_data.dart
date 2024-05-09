
class PetUpData {
  final String petId;
  final String name;
  final String breed;
  final String age;
  final String weight;
  final String color;
  final String photo;

  PetUpData({
    required this.petId,
    required this.name,
    required this.breed,
    required this.age,
    required this.weight,
    required this.photo, 
    required this.color,
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
    };
  }
  
}