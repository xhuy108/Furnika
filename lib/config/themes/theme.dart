import 'package:flutter/material.dart';
import 'package:furnika/config/themes/app_palette.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.background,
  );
}
