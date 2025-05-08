// models/user_model.dart
class UserModel {
  final String id;
  final String name;
  final String email;
  final int age;
  final int height;
  final double weight;
  final String gender;
  final String activityLevel;
  final String goal;
  final String createdAt;
  final String lastLogin;

  // Constructeur
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
    required this.activityLevel,
    required this.goal,
    required this.createdAt,
    required this.lastLogin,
  });

  // Convertir un utilisateur en Map (pour l'enregistrer dans Firebase ou SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'height': height,
      'weight': weight,
      'gender': gender,
      'activityLevel': activityLevel,
      'goal': goal,
      'createdAt': createdAt,
      'lastLogin': lastLogin,
    };
  }

  // Convertir un Map en utilisateur (lors de la récupération des données de Firebase ou SQLite)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      age: map['age'] ?? 0,
      height: map['height'] ?? 0,
      weight: map['weight'] ?? 0.0,
      gender: map['gender'] ?? '',
      activityLevel: map['activityLevel'] ?? '',
      goal: map['goal'] ?? '',
      createdAt: map['createdAt'] ?? '',
      lastLogin: map['lastLogin'] ?? '',
    );
  }
}
