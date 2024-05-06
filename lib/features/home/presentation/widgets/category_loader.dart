import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:shimmer/shimmer.dart';

class CategoryLoader extends StatelessWidget {
  const CategoryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppPalette.secondary.withOpacity(0.9),
      highlightColor: AppPalette.secondary.withOpacity(0.5),
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppPalette.secondary.withOpacity(0.9),
        ),
      ),
    );
  }
}
