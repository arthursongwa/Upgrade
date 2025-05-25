// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:upgrade/ui/screens/home.dart';
import 'package:upgrade/ui/screens/nutritionScreen.dart';
import 'package:upgrade/ui/screens/profileScreen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: 'home', builder: (context, state) => const Home()),
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
