import 'package:flutter/material.dart';
import 'package:upgrade/core/theme.dart';
// import 'package:upgrade/core/router.dart'; // ← le router défini

// import 'ui/screens/register_screen.dart';
// import 'ui/screens/home_screen.dart';
import './auth_wrapper.dart';
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routerConfig: router,
//       theme: AppTheme.darkTheme, // si tu as défini un thème sombre
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Upgrade App',
      theme: AppTheme.darkTheme,
      home: AuthWrapper(),
    );
  }
}
