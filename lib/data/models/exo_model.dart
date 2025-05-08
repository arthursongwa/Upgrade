// models/exo_model.dart
class ExoModel {
  final String id; // ex_001
  final String name;
  final String muscleGroup;
  final String equipment;
  final String difficulty;
  final String type;
  final String videoUrl;
  final String description;
  final String createdAt; // 2025-05-01T12:00:00Z

  // Constructeur
  ExoModel({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.equipment,
    required this.difficulty,
    required this.type,
    required this.videoUrl,
    required this.description,
    required this.createdAt,
  });

  // Convertir un exo en Map (pour l'enregistrer dans Firebase ou SQLite)
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "muscleGroup": muscleGroup,
      "equipment": equipment,
      "difficulty": difficulty,
      "type": type,
      "videoUrl": videoUrl,
      "description": description,
      "createdAt": createdAt,
    };
  }

  // Convertir un Map en exo (lors de la récupération des données de Firebase ou SQLite)
  factory ExoModel.fromMap(Map<String, dynamic> map) {
    return ExoModel(
      id: map["id"] ?? '',
      name: map["name"] ?? '',
      muscleGroup: map["muscleGroup"] ?? '',
      equipment: map["equipment"] ?? '',
      difficulty: map["difficulty"] ?? '',
      type: map["type"] ?? '',
      videoUrl: map["videoUrl"] ?? '',
      description: map["description"] ?? '',
      createdAt: map["createdAt"] ?? '',
    );
  }
}
