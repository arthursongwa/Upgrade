// models/meal_log_model.dart
import 'aliment_model.dart'; // Assurez-vous que ce fichier est importé

class MealLogModel {
  final String id;
  final String userId;
  final String date;
  final Map<String, List<AlimentModel>> meals; // Breakfast, lunch, dinner
  final int totalCalories;
  final int totalProteins;
  final int totalCarbs;
  final int totalFats;

  // Constructeur
  MealLogModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.meals,
    required this.totalCalories,
    required this.totalProteins,
    required this.totalCarbs,
    required this.totalFats,
  });

  // Convertir un MealLog en Map (pour l'enregistrer dans Firebase ou SQLite)
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "date": date,
      "meals": {
        "breakfast":
            meals["breakfast"]?.map((meal) => meal.toMap()).toList() ?? [],
        "lunch": meals["lunch"]?.map((meal) => meal.toMap()).toList() ?? [],
        "dinner": meals["dinner"]?.map((meal) => meal.toMap()).toList() ?? [],
      },
      "totalCalories": totalCalories,
      "totalProteins": totalProteins,
      "totalCarbs": totalCarbs,
      "totalFats": totalFats,
    };
  }

  // Convertir un Map en MealLog (lors de la récupération des données de Firebase ou SQLite)
  factory MealLogModel.fromMap(Map<String, dynamic> map) {
    return MealLogModel(
      id: map["id"] ?? '',
      userId: map["userId"] ?? '',
      date: map["date"] ?? '',
      meals: {
        "breakfast":
            (map["meals"]["breakfast"] as List?)
                ?.map((meal) => AlimentModel.fromMap(meal))
                .toList() ??
            [],
        "lunch":
            (map["meals"]["lunch"] as List?)
                ?.map((meal) => AlimentModel.fromMap(meal))
                .toList() ??
            [],
        "dinner":
            (map["meals"]["dinner"] as List?)
                ?.map((meal) => AlimentModel.fromMap(meal))
                .toList() ??
            [],
      },
      totalCalories: map["totalCalories"] ?? 0,
      totalProteins: map["totalProteins"] ?? 0,
      totalCarbs: map["totalCarbs"] ?? 0,
      totalFats: map["totalFats"] ?? 0,
    );
  }
}
