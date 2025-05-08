// models/session_model.dart

class SessionModel {
  final String id; // session_2025-05-06_user_abc123
  final String userId; // user_abc123
  final String routineId; // routine_push_day
  final String date; // 2025-05-06
  final List<Map<String, dynamic>>
  exercisesDone; // Liste des exercices faits avec séries, reps et poids
  final int durationMin; // Durée en minutes
  final int caloriesBurned; // Calories brûlées

  SessionModel({
    required this.id,
    required this.userId,
    required this.routineId,
    required this.date,
    required this.exercisesDone,
    required this.durationMin,
    required this.caloriesBurned,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "user_id": userId,
      "routine_id": routineId,
      "date": date,
      "exercises_done": exercisesDone,
      "duration_min": durationMin,
      "calories_burned": caloriesBurned,
    };
  }

  factory SessionModel.fromMap(Map<String, dynamic> map) {
    return SessionModel(
      id: map["id"] ?? '',
      userId: map["user_id"] ?? '',
      routineId: map["routine_id"] ?? '',
      date: map["date"] ?? '',
      exercisesDone: List<Map<String, dynamic>>.from(
        map["exercises_done"] ?? [],
      ),
      durationMin: map["duration_min"] ?? 0,
      caloriesBurned: map["calories_burned"] ?? 0,
    );
  }
}
