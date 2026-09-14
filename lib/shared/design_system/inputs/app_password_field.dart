import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/inputs/app_text_field.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// Password field with a show/hide toggle. Thin stateful wrapper over
/// [AppTextField].
class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    this.label,
    this.controller,
    this.hint,
    this.validator,
    this.errorText,
    this.isRequired = false,
    this.onChanged,
    this.textInputAction,
    this.onSubmitted,
  });

  final String? label;
  final TextEditingController? controller;
  final String? hint;
  final String? Function(String?)? validator;
  final String? errorText;
  final bool isRequired;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: widget.label,
      controller: widget.controller,
      hint: widget.hint,
      validator: widget.validator,
      errorText: widget.errorText,
      isRequired: widget.isRequired,
      onChanged: widget.onChanged,
      obscureText: _obscure,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      prefixIcon: Icon(Icons.lock_outline_rounded, size: 20.s, color: AppColors.textTertiary),
      suffixIcon: IconButton(
        icon: Icon(
          _obscure ? Icons.visibility_off_rounded : Icons.visibility_rounded,
          size: 20.s,
          color: AppColors.textTertiary,
        ),
        onPressed: () => setState(() => _obscure = !_obscure),
      ),
    );
  }
}
