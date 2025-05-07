import 'package:flutter/material.dart';
import 'package:upgrade/core/theme.dart';
import 'package:upgrade/core/router.dart'; // ← le router défini

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme.darkTheme, // si tu as défini un thème sombre
    );
  }
}
