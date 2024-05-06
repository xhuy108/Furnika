import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:shimmer/shimmer.dart';

class OptionLoader extends StatelessWidget {
  const OptionLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppPalette.secondary.withOpacity(0.9),
      highlightColor: AppPalette.secondary.withOpacity(0.5),
      child: Container(
        width: 50.w,
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.r),
          color: AppPalette.secondary.withOpacity(0.9),
        ),
      ),
    );
  }
}
