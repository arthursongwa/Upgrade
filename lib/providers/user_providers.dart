import 'package:flutter/material.dart';
import '../data/models/user_model.dart';
import '../data/services/user_services.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> loadUser(String uid) async {
    try {
      print("Chargement utilisateur $uid...");
      final fetchedUser = await UserService().getUser(uid);
      if (fetchedUser != null) {
        _user = fetchedUser;
        print("Utilisateur chargé : ${_user!.name}");
        notifyListeners();
      } else {
        print("Aucun utilisateur trouvé pour l'ID $uid");
      }
    } catch (e) {
      print("Erreur lors du chargement de l'utilisateur : $e");
    }
  }

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
