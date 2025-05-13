import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/typography.dart';
import '../../core/constant.dart';

class PrimaryInput extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Icon? icon;
  final double? width;
  final String? Function(String?)? validator;

  const PrimaryInput({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.width = double.infinity,
    this.validator,
  }) : super(key: key);

  @override
  State<PrimaryInput> createState() => _PrimaryInputState();
}

class _PrimaryInputState extends State<PrimaryInput> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppRadius.lg),
      child: SizedBox(
        width: widget.width,
        child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: _obscure,
          keyboardType: widget.keyboardType,
          style: AppTypography.button,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTypography.body.copyWith(
              color: AppColors.text.withOpacity(0.6),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md,
              horizontal: AppSpacing.md,
            ),
            filled: true,
            prefixIcon: widget.icon,
            suffixIcon:
                widget.obscureText
                    ? IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.text.withOpacity(0.6),
                      ),
                      onPressed: _toggleVisibility,
                    )
                    : null,
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
