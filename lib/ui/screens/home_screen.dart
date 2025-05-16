import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    print("👋 Déconnecté !");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil'), centerTitle: true),
      body: Column(
        children: [
          Text("✅ Connecté en tant que : "),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: signOut,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text("Se déconnecter"),
          ),
        ],
      ),
    );
  }
}
