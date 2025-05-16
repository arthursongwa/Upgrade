import 'package:flutter/material.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator(color: Colors.white)),
          );
        }
        if (snapshot.hasData) {
          return HomeScreen(); // ou MainApp()
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
