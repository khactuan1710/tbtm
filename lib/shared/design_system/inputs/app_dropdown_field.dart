import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// A read-only, tappable field that looks like an input but opens a picker
/// (bottom sheet) on tap. Shows [valueLabel] or [hint] plus a chevron.
class AppDropdownField extends StatelessWidget {
  const AppDropdownField({
    super.key,
    this.label,
    required this.valueLabel,
    required this.onTap,
    this.hint = 'Chọn...',
    this.isRequired = false,
    this.errorText,
    this.prefixIcon,
    this.enabled = true,
  });

  final String? label;
  final String? valueLabel;
  final VoidCallback onTap;
  final String hint;
  final bool isRequired;
  final String? errorText;
  final Widget? prefixIcon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final hasValue = valueLabel != null && valueLabel!.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text.rich(
            TextSpan(
              text: label,
              style: TextStyle(
                fontSize: 13.5.s,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
              children: [
                if (isRequired)
                  const TextSpan(text: ' *', style: TextStyle(color: AppColors.error)),
              ],
            ),
          ),
          SizedBox(height: 6.s),
        ],
        InkWell(
          borderRadius: BorderRadius.circular(14.s),
          onTap: enabled ? onTap : null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.s, vertical: 15.s),
            decoration: BoxDecoration(
              color: enabled ? AppColors.inputFill : AppColors.disabledBg,
              borderRadius: BorderRadius.circular(14.s),
              border: Border.all(
                color: errorText != null ? AppColors.error : AppColors.inputBorder,
              ),
            ),
            child: Row(
              children: [
                if (prefixIcon != null) ...[prefixIcon!, SizedBox(width: 10.s)],
                Expanded(
                  child: Text(
                    hasValue ? valueLabel! : hint,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.s,
                      color: hasValue ? AppColors.textPrimary : AppColors.inputHint,
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textTertiary, size: 24.s),
              ],
            ),
          ),
        ),
        if (errorText != null) ...[
          SizedBox(height: 6.s),
          Text(errorText!, style: TextStyle(fontSize: 12.s, color: AppColors.error)),
        ],
      ],
    );
  }
}
