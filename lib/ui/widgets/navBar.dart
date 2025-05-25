import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/constant.dart';
import '../../providers/navigationProvider.dart';

class NavBar extends StatefulWidget {
  final NavigationProvider navNotif;

  const NavBar({super.key, required this.navNotif});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.md),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.primary,
            selectedItemColor: AppColors.greenLight,
            unselectedItemColor: Colors.white,
            currentIndex: widget.navNotif.currentIndex,
            onTap: widget.navNotif.changeTab,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.egg),
                label: 'Nutrition',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                label: 'Tranning',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.query_stats),
                label: 'Statistic',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
