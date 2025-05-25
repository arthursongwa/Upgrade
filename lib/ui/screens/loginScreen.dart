import 'package:flutter/material.dart';
import 'package:upgrade/core/colors.dart';
import '../components/primary_button.dart';
import '../components/primary_input.dart';
import '../../core/typography.dart';
import '../../core/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../providers/user_providers.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onToggle;

  const LoginScreen({super.key, required this.onToggle});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final userProvider = Provider.of<UserProvider>(context, listen: false);

        await userProvider.loadUser(
          firebaseUser.uid,
        ); // Charge depuis Firestore

        // Navigator.pushReplacementNamed(context, '/home');
      }
      print("✅ Connexion réussie !");
    } catch (e) {
      print("❌ Erreur de connexion : $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("❌ Erreur de connexion : $e")));
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
                    child: Text('LOGIN', style: AppTypography.h1),
                  ),
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
                // SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                      side: BorderSide(
                        color:
                            AppColors
                                .secondary, // couleur de la bordure décochée ET cochée
                        width: 1, // épaisseur
                      ),
                      fillColor: WidgetStateProperty.resolveWith<Color>((
                        Set<WidgetState> states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors
                              .secondary; // couleur quand c’est coché
                        }
                        return AppColors.primary; // couleur quand c’est décoché
                      }),
                    ),
                    Text(
                      "Se souvenir de moi",
                      style: AppTypography.smallText.copyWith(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.md),
                PrimaryButton(label: "LOGIN", onPressed: _login),
                SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    Spacer(),
                    MouseRegion(
                      cursor:
                          SystemMouseCursors
                              .click, // Curseur en forme de sélection de texte
                      child: Text(
                        "Mot de passe oubliée ?",
                        style: AppTypography.smallText.copyWith(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ],
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
                          'lib/assets/img/icons8-google-480.png', // assure-toi que l'icône est dans ton dossier assets
                          height: 30,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Se connecter avec Google",
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
                    Text(
                      "Pas encore membre ? ",
                      style: AppTypography.smallText,
                    ),
                    GestureDetector(
                      onTap: widget.onToggle,
                      child: MouseRegion(
                        cursor:
                            SystemMouseCursors
                                .click, // Curseur en forme de sélection de texte
                        child: Text(
                          "🔥S'inscrire",
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
