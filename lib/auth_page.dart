import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  String message = '';

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passCtrl.text.trim(),
      );
      setState(() => message = "✅ Inscription réussie !");
    } catch (e) {
      setState(() => message = "❌ Erreur d'inscription : $e");
    }
  }

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passCtrl.text.trim(),
      );
      setState(() => message = "✅ Connexion réussie !");
    } catch (e) {
      setState(() => message = "❌ Erreur de connexion : $e");
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() => message = "👋 Déconnecté !");
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text('Auth Firebase')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (user == null) ...[
              TextField(
                controller: emailCtrl,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: passCtrl,
                obscureText: true,
                decoration: InputDecoration(labelText: "Mot de passe"),
              ),
              SizedBox(height: 16),
              ElevatedButton(onPressed: signIn, child: Text("Se connecter")),
              ElevatedButton(onPressed: signUp, child: Text("S'inscrire")),
            ] else ...[
              Text("✅ Connecté en tant que : ${user.email}"),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: signOut,
                child: Text("Se déconnecter"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
            SizedBox(height: 20),
            Text(message, style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
