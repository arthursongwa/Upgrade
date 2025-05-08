// models/Aliment_model.dart
class AlimentModel {
  final String id; //food_001
  final String name;
  final String brand;
  final String category;
  final int portionSize;
  final int calories;
  final int proteins;
  final int carbs;
  final int fats;
  final String createdAt; //2025-05-01T10:30:00Z

  // Constructeur
  AlimentModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.portionSize,
    required this.calories,
    required this.proteins,
    required this.carbs,
    required this.fats,
    required this.createdAt,
  });

  // Convertir un utilisateur en Map (pour l'enregistrer dans Firebase ou SQLite)
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "brand": brand,
      "category": category,
      "portionSize": portionSize,
      "calories": calories,
      "proteins": proteins,
      "carbs": carbs,
      "fats": fats,
      "createdAt": createdAt,
    };
  }

  // Convertir un Map en utilisateur (lors de la récupération des données de Firebase ou SQLite)
  factory AlimentModel.fromMap(Map<String, dynamic> map) {
    return AlimentModel(
      id: map["id"] ?? '',
      name: map["name"] ?? '',
      brand: map["brand"] ?? '',
      category: map["category"] ?? '',
      portionSize: map["portionSize"] ?? 0,
      calories: map["calories"] ?? 0,
      proteins: map["proteins"] ?? 0,
      carbs: map["carbs"] ?? 0,
      fats: map["fats"] ?? 0,
      createdAt: map["createdAt"] ?? '',
    );
  }
}
