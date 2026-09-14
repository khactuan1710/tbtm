import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// Modal bottom sheet with a grab handle, optional title header and a scrollable
/// body. Returns the value the sheet pops with.
class AppBottomSheet {
  AppBottomSheet._();

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget body,
    String? title,
    bool isScrollControlled = true,
    bool showHeader = true,
    double? maxHeightFactor,
  }) {
    final maxHeight = MediaQuery.sizeOf(context).height *
        (maxHeightFactor ?? 0.85);

    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: AppColors.surface,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22.s)),
      ),
      builder: (ctx) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.viewInsetsOf(ctx).bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.s),
                Container(
                  width: 44.s,
                  height: 5.s,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(3.s),
                  ),
                ),
                if (showHeader && title != null) ...[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.s, 14.s, 12.s, 6.s),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 17.s,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close_rounded, size: 22.s, color: AppColors.textTertiary),
                          onPressed: () => Navigator.of(ctx).pop(),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                ] else
                  SizedBox(height: 8.s),
                Flexible(child: body),
              ],
            ),
          ),
        );
      },
    );
  }
}
