import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.height,
    this.width,
    this.backgroundColor,
    this.foregroundColor,
    this.fontSize,
    this.padding,
    this.onTap,
  });

  final String title;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppPalette.primary,
          padding: padding,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize ?? 15.sp,
            fontWeight: FontWeight.w600,
            color: foregroundColor ?? AppPalette.background,
          ),
        ),
      ),
    );
  }
}
