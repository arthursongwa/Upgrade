// models/routine_model.dart

class RoutineWorkModel {
  final String id; // routine_push_day
  final String userId; // user_abc123
  final String name; // Push Day
  final String description; // Pectoraux, épaules, triceps
  final List<Map<String, dynamic>>
  exercises; // Liste d'exercices avec les informations directement

  // Constructeur
  RoutineWorkModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.exercises, // Liste d'exercices
  });

  // Convertir une routine en Map (pour l'enregistrer dans Firebase ou SQLite)
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "user_id": userId,
      "name": name,
      "description": description,
      "exercises": exercises, // On conserve les exercices sous forme de Map
    };
  }

  // Convertir un Map en routine (lors de la récupération des données de Firebase ou SQLite)
  factory RoutineWorkModel.fromMap(Map<String, dynamic> map) {
    return RoutineWorkModel(
      id: map["id"] ?? '',
      userId: map["user_id"] ?? '',
      name: map["name"] ?? '',
      description: map["description"] ?? '',
      exercises: List<Map<String, dynamic>>.from(
        map["exercises"] ?? [],
      ), // On convertit directement les exercices
    );
  }
}
