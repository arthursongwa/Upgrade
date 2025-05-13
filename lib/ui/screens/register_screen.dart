import 'package:flutter/material.dart';
import 'package:upgrade/core/colors.dart';
import '../components/primary_button.dart';
import '../components/primary_input.dart';
import '../../core/typography.dart';
import '../../core/constant.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool rememberMe = false;

  final _formKey = GlobalKey<FormState>();

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
                  hintText: "Mot de passe",
                  icon: Icon(
                    Icons.lock_outline,
                    color: AppColors.text.withOpacity(0.6),
                  ),
                  obscureText: true,
                ),
                PrimaryInput(
                  hintText: "ReMot de passe",
                  icon: Icon(
                    Icons.lock_outline,
                    color: AppColors.text.withOpacity(0.6),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: AppSpacing.md),
                PrimaryButton(
                  label: "REGISTER",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Auth OK
                    }
                  },
                ),
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
