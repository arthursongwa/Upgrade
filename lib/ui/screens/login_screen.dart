import 'package:flutter/material.dart';
import 'package:upgrade/core/colors.dart';
import '../components/primary_button.dart';
import '../components/primary_input.dart';
import '../../core/typography.dart';
import '../../core/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    child: Text('LOGIN', style: AppTypography.h1),
                  ),
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
                // SizedBox(height: AppSpacing.md),
                PrimaryInput(
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
                      fillColor: MaterialStateProperty.resolveWith<Color>((
                        Set<MaterialState> states,
                      ) {
                        if (states.contains(MaterialState.selected)) {
                          return AppColors
                              .secondary; // couleur quand c’est coché
                        }
                        return AppColors.primary; // couleur quand c’est décoché
                      }),
                    ),
                    Text("Se souvenir de moi", style: AppTypography.button),
                  ],
                ),
                SizedBox(height: AppSpacing.md),
                PrimaryButton(
                  label: "LOGIN",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Auth OK
                    }
                  },
                ),
                SizedBox(height: AppSpacing.lg),

                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("ou", style: AppTypography.body),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                  ],
                ),

                SizedBox(height: AppSpacing.md),

                GestureDetector(
                  onTap: () {
                    // TODO: Logique de connexion avec Google ici
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.asset(
                        //   'images/icons8-google-480.png', // assure-toi que l'icône est dans ton dossier assets
                        //   height: 20,
                        // ),
                        SizedBox(width: 12),
                        Text(
                          "Se connecter avec Google",
                          style: AppTypography.button.copyWith(
                            color: AppColors.text,
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
                    Text("Pas encore membre ? ", style: AppTypography.body),
                    GestureDetector(
                      onTap: () {
                        // Navigue vers la page d'inscription
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "🔥Inscris-toi",
                        style: AppTypography.body.copyWith(
                          color: AppColors.greenLight,
                          fontWeight: FontWeight.bold,
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
