import 'package:flutter/material.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil'), centerTitle: true),
      body: const Center(
        child: Text('Nutrittion !', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
