import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:upgrade/firebase_options.dart';
// import 'auth_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'data/models/user_model.dart';
// import 'data/services/user_services.dart';
import 'package:provider/provider.dart';
import 'providers/user_providers.dart';
import 'ui/screens/login_screen.dart';
import 'core/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      title: 'Upgrade - ',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
