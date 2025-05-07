import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil'), centerTitle: true),
      body: const Center(
        child: Text(
          'Bienvenue sur l\'écran d\'accueil !',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
