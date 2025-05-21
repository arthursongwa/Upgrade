import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/typography.dart';
import '../../core/constant.dart'; // supposons qu’il y a un AppSpacing

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final Icon? icon;
  final Color bgColor;
  final Color fgColor;
  final EdgeInsets padding;

  const PrimaryButton({
    required this.label,
    this.onPressed,
    this.width = double.infinity,
    this.icon,
    this.bgColor = AppColors.secondary,
    this.fgColor = AppColors.text,
    this.padding = const EdgeInsets.symmetric(
      vertical: AppSpacing.lg,
      horizontal: AppSpacing.xl,
    ),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(bgColor),
          foregroundColor: WidgetStatePropertyAll(fgColor),
          padding: WidgetStatePropertyAll(padding),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.sm),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: AppTypography.button.copyWith(color: fgColor)),
            if (icon != null) Spacer(),
            if (icon != null) icon!,
          ],
        ),
      ),
    );
  }
}
