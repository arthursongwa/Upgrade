import 'package:flutter/material.dart';
import 'package:upgrade/ui/screens/register_screen.dart';
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
        print("User data: ${snapshot.data}");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator(color: Colors.white)),
          );
        }
        if (snapshot.hasData) {
          return HomeScreen(); // ou MainApp()
        } else {
          return AuthScreenSwitcher();
        }
      },
    );
  }
}

class AuthScreenSwitcher extends StatefulWidget {
  const AuthScreenSwitcher({super.key});

  @override
  State<AuthScreenSwitcher> createState() => _AuthScreenSwitcherState();
}

class _AuthScreenSwitcherState extends State<AuthScreenSwitcher> {
  bool showLogin = true;

  void toggle() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLogin
        ? LoginScreen(onToggle: toggle)
        : RegisterScreen(onToggle: toggle);
  }
}
