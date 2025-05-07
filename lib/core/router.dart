// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:upgrade/ui/screens/home_screen.dart';
import 'package:upgrade/ui/screens/nutrition_screen.dart';
import 'package:upgrade/ui/screens/profile_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/nutrition',
      name: 'nutrition',
      builder: (context, state) => const NutritionScreen(),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
