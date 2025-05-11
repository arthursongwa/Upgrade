import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/typography.dart';
import '../../core/constant.dart'; // supposons qu’il y a un AppSpacing

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;

  const PrimaryButton({
    required this.label,
    this.onPressed,
    this.width = double.infinity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
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
        child: Text(label, style: AppTypography.button),
      ),
    );
  }
}
