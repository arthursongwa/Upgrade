import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.secondary, // Couleur du curseur
      selectionColor: AppColors.secondary, // Couleur de fond de la sélection
      selectionHandleColor:
          AppColors.secondary, // Couleur des poignées de sélection
    ),
    // useMaterial3: true,
    // brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      titleTextStyle: AppTypography.h1,
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.h1,
      bodyLarge: AppTypography.body,
      bodySmall: AppTypography.smallText,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );
}
