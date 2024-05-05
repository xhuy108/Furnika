import 'package:flutter/material.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static _border([Color color = Colors.transparent]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color,
          width: 2,
        ),
      );

  static final lightThemeMode = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.primary),
    scaffoldBackgroundColor: AppPalette.background,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppPalette.textFieldBackground,
      filled: true,
      enabledBorder: _border(),
      focusedBorder: _border(AppPalette.textFieldStroke),
      errorBorder: _border(AppPalette.error),
      focusedErrorBorder: _border(AppPalette.error),
      errorStyle: const TextStyle(
        color: AppPalette.error,
      ),
    ),
    textTheme: GoogleFonts.lexendTextTheme(),
    datePickerTheme: DatePickerThemeData(
      todayBackgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppPalette.primary;
          }
          return Colors.transparent;
        },
      ),
      todayForegroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return AppPalette.primary;
        },
      ),
      todayBorder: const BorderSide(
        color: AppPalette.primary,
        width: 1,
      ),
      dayBackgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppPalette.primary;
          }
          return Colors.transparent;
        },
      ),
      cancelButtonStyle: const ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(AppPalette.primary),
      ),
      confirmButtonStyle: const ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(AppPalette.primary),
      ),
    ),
  );
}
