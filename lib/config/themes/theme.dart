import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    scaffoldBackgroundColor: AppPalette.background,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppPalette.textFieldBackground,
      filled: true,
      enabledBorder: _border(),
      focusedBorder: _border(AppPalette.textFieldStroke),
      errorBorder: _border(AppPalette.error),
    ),
    textTheme: GoogleFonts.lexendTextTheme(),
  );
}
