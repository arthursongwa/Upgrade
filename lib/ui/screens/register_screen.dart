import 'package:flutter/material.dart';
import 'package:upgrade/core/colors.dart';
import '../components/primary_button.dart';
import '../components/primary_input.dart';
import '../../core/typography.dart';
import '../../core/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool rememberMe = false;

  // final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  Future<void> signUp() async {
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final username = _usernameController.text.trim();
      final phone = _phoneController.text.trim();

      // Étape 1 : Créer l'utilisateur dans Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("✅ Inscription réussie !");

      // Étape 2 : Obtenir l'UID
      String uid = userCredential.user!.uid;

      print("✅ UID Get!" + uid);
      // Étape 3 : Enregistrer les données dans Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
      });
      print("✅ Data Save !");
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("✅ Connexion reussie !");
    } catch (e) {
      print("❌ Erreur d'inscription : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          // meilleure UX pour clavier mobile
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: AppSpacing.lg),
                    child: Text('REGISTER', style: AppTypography.h1),
                  ),
                ),
                PrimaryInput(
                  controller: _usernameController,
                  hintText: "Username",
                  keyboardType: TextInputType.name,
                  icon: Icon(
                    Icons.person,
                    color: AppColors.text.withOpacity(0.6),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer votre email";
                    }
                    if (!value.contains('@')) {
                      return "Email invalide";
                    }
                    return null;
                  },
                ),
                PrimaryInput(
                  controller: _emailController,
                  hintText: "Adresse email",
                  keyboardType: TextInputType.emailAddress,
                  icon: Icon(
                    Icons.email_outlined,
                    color: AppColors.text.withOpacity(0.6),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer votre email";
                    }
                    if (!value.contains('@')) {
                      return "Email invalide";
                    }
                    return null;
                  },
                ),
                PrimaryInput(
                  controller: _phoneController,
                  hintText: "Téléphone",
                  keyboardType: TextInputType.phone,
                  icon: Icon(
                    Icons.phone_outlined,
                    color: AppColors.text.withOpacity(0.6),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer votre email";
                    }
                    if (!value.contains('@')) {
                      return "Email invalide";
                    }
                    return null;
                  },
                ),
                // SizedBox(height: AppSpacing.md),
                PrimaryInput(
                  controller: _passwordController,
                  hintText: "Mot de passe",
                  icon: Icon(
                    Icons.lock_outline,
                    color: AppColors.text.withOpacity(0.6),
                  ),
                  obscureText: true,
                ),
                PrimaryInput(
                  controller: _rePasswordController,
                  hintText: "ReMot de passe",
                  icon: Icon(
                    Icons.lock_outline,
                    color: AppColors.text.withOpacity(0.6),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: AppSpacing.md),
                PrimaryButton(label: "REGISTER", onPressed: signUp),
                SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "ou",
                        style: AppTypography.body.copyWith(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                  ],
                ),

                SizedBox(height: AppSpacing.md),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.text,
                      padding: EdgeInsets.symmetric(
                        vertical: AppSpacing.lg, // par exemple 16.0
                        horizontal: AppSpacing.xl, // par exemple 32.0
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.sm,
                        ), // par exemple 8.0
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/icons8-google-480.png', // assure-toi que l'icône est dans ton dossier assets
                          height: 30,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "S'inscrire avec Google",
                          style: AppTypography.button.copyWith(
                            color: AppColors.background,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Déja un compte ?", style: AppTypography.smallText),
                    GestureDetector(
                      onTap: () {
                        // Navigue vers la page d'inscription
                        Navigator.pushNamed(context, '/login');
                      },
                      child: MouseRegion(
                        cursor:
                            SystemMouseCursors
                                .click, // Curseur en forme de sélection de texte
                        child: Text(
                          "🔥Connexion",
                          style: AppTypography.body.copyWith(
                            color: Color(0xFF0072BB),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
