import 'package:flutter/material.dart';

/// Shortcuts for theme access so widgets read `context.textTheme` /
/// `context.colorScheme` instead of `Theme.of(context)...`.
extension AppContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => MediaQuery.sizeOf(this);
}
