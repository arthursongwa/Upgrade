import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upgrade/ui/screens/dashboardScreen.dart';
import 'package:upgrade/ui/widgets/navBar.dart';
import 'package:upgrade/core/colors.dart';

import '../../providers/navigationProvider.dart';
import '../../ui/screens/nutritionScreen.dart';
import '../../ui/screens/trainingScreen.dart';
import '../../ui/screens/statScreen.dart';
import '../../ui/screens/profileScreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final List<Widget> _pages = const [
    DashboardScreen(),
    NutritionScreen(),
    TrainingScreen(),
    StatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(index: navProvider.currentIndex, children: _pages),
      bottomNavigationBar: NavBar(navNotif: navProvider),
    );
  }
}
