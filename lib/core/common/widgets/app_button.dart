import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.height,
    this.width = double.infinity,
    this.backgroundColor,
    this.foregroundColor,
    this.onTap,
  });

  final String title;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppPalette.primary,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: foregroundColor ?? AppPalette.background,
          ),
        ),
      ),
    );
  }
}
