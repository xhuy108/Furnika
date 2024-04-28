import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: AppPalette.textPrimary,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
