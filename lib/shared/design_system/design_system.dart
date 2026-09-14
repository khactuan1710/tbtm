/// Single-import barrel for the design system.
///
/// Screens and widgets should `import 'design_system.dart'` and get Material,
/// bloc, spacing ([Gap]), the [.s] size extension, theme, base page, DI
/// ([getIt]) and every reusable widget in one line.
library;

export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:gap/gap.dart';

export 'package:quanlymaygiat/core/base/base_cubit.dart';
export 'package:quanlymaygiat/core/base/base_page.dart';
export 'package:quanlymaygiat/core/di/injection.dart';
export 'package:quanlymaygiat/shared/theme/app_colors.dart';
export 'package:quanlymaygiat/shared/theme/app_typography.dart';

export 'context_extensions.dart';
export 'responsive/sizes.dart';

export 'banners/app_snackbar.dart';
export 'bottom_sheet/app_bottom_sheet.dart';
export 'buttons/app_button.dart';
export 'buttons/app_icon_button.dart';
export 'dialogs/app_confirm_dialog.dart';
export 'empty/app_empty.dart';
export 'error/app_error_view.dart';
export 'inputs/app_dropdown_field.dart';
export 'inputs/app_password_field.dart';
export 'inputs/app_search_field.dart';
export 'inputs/app_text_field.dart';
export 'layouts/app_auth_background.dart';
export 'layouts/app_scaffold.dart';
export 'list/app_refresh.dart';
export 'loading/app_loading.dart';
export 'navigation/base_app_bar.dart';
export 'tiles/app_card.dart';
export 'tiles/app_info_row.dart';
export 'tiles/app_status_badge.dart';
