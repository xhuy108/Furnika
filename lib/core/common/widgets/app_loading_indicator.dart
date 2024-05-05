import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppPalette.background,
        ),
        child: const CircularProgressIndicator(
          color: AppPalette.primary,
        ),
      ),
    );
  }
}
