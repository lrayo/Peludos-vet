
class PetUpData {

  final String name;
  final String breed;
  final String age;
  final String weight;
  
  final String photo;

  PetUpData({
    required this.name,
    required this.breed,
    required this.age,
    required this.weight,
    required this.photo,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'breed': breed,
      'age': age,
      'weight': weight,
      'photo': photo,
    };
  }
  
}