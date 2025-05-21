import 'package:flutter/material.dart';
import '../components/primary_button.dart';
import '../../core/typography.dart';
import '../../core/colors.dart';
import '../../core/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../providers/user_providers.dart';
import 'package:provider/provider.dart';
import '../widgets/customLineChart.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    print("👋 Déconnecté !");
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bonjour ${(user != null) ? user.name : "Erreur"}",
                    style: AppTypography.h1,
                  ),
                  Text("Mardi 16 Avril", style: AppTypography.smallText),
                ],
              ),
              SizedBox(height: AppSpacing.md),
              PrimaryButton(
                label: "Ajouter un repas",
                icon: Icon(
                  Icons.add_circle_outline,
                  size: 24,
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: AppSpacing.md,
                  horizontal: AppSpacing.md,
                ),
              ),
              SizedBox(height: AppSpacing.md),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Objectifs", style: AppTypography.button),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary, // couleur de fond
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // coins arrondis optionnel
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 40.0, // taille du cercle
                                  lineWidth: 8.0, // épaisseur de la barre
                                  percent: 0.7, // progression entre 0 et 1
                                  center: Text(
                                    "723",
                                    style: AppTypography.button,
                                  ),
                                  progressColor: AppColors.greenLight,
                                  backgroundColor: AppColors.greenDark,
                                  circularStrokeCap:
                                      CircularStrokeCap
                                          .round, // arrondi aux extrémités
                                ),
                                SizedBox(height: AppSpacing.sm),
                                Text("Calories", style: AppTypography.body),
                                Text("Restantes", style: AppTypography.body),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: AppSpacing.lg),
                      Container(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary, // couleur de fond
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // coins arrondis optionnel
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: AppColors.greenLight,
                                ),
                                SizedBox(height: AppSpacing.sm),
                                Text("Entrainement", style: AppTypography.body),
                                Text(
                                  "Enregistrer",
                                  style: AppTypography.smallText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: AppSpacing.lg),
                      Container(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary, // couleur de fond
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // coins arrondis optionnel
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("80", style: AppTypography.h1),
                                    Text("kg", style: AppTypography.smallText),
                                  ],
                                ),
                                Text("Poids", style: AppTypography.smallText),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text("✅ Connecté en tant que : "),
              SizedBox(height: 16),
              LineChartSample2(
                spots: [
                  FlSpot(0, 3),
                  FlSpot(2, 2),
                  FlSpot(4, 3),
                  FlSpot(4.8, 5),
                  FlSpot(5, 2),
                  FlSpot(5.5, 3),
                  FlSpot(6.3, 4),
                  FlSpot(6.8, 3.1),
                  FlSpot(7.8, 4),
                  FlSpot(10.2, 3.1),
                  FlSpot(11, 4),
                ],
                unitX: 'gr',
                unitY: 'tr',
                gridColor: AppColors.background,
                color: AppColors.greenLight,
                gradientColors: [
                  AppColors.greenLight,
                  AppColors.greenDark,
                  AppColors.primary,
                ],
                barWidth: 2,
              ),
              ElevatedButton(
                onPressed: signOut,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text("Se déconnecter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
