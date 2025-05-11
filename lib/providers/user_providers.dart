import 'package:flutter/material.dart';
import '../data/models/user_model.dart';
import '../data/services/user_services.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> loadUser(String uid) async {
    _user = await UserService().getUser(uid);
    notifyListeners(); // informe l’interface que les données ont changé
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
