import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:upgrade/firebase_options.dart';
import 'auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'data/models/user_model.dart';
import 'data/services/user_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  try {
    final user = UserModel(
      id: "er",
      name: "",
      email: "",
      age: 12,
      height: 12,
      weight: 12,
      gender: "",
      activityLevel: "",
      goal: "",
      createdAt: "",
      lastLogin: "",
    );
    await UserService().createUser(user);
    print("Bonjor");
  } catch (e) {
    print("Bonsoire $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
