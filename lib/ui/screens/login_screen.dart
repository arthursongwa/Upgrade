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
                PrimaryButton(label: "LOGIN"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
