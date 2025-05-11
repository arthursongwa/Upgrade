import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/typography.dart';
import '../../core/constant.dart'; // Contient AppSpacing

class PrimaryInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Icon? icon;
  final double? width;

  const PrimaryInput({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppRadius.lg),
      child: SizedBox(
        width: width, // largeur fixe
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: AppTypography.button,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTypography.button.copyWith(
              color: AppColors.text.withOpacity(0.6),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md,
              horizontal: AppSpacing.md,
            ),
            filled: true,
            prefixIcon: icon,
            fillColor: AppColors.primary,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              borderSide: BorderSide(color: AppColors.secondary, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              borderSide: BorderSide(color: AppColors.secondary, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
