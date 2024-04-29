import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:gap/gap.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.title,
    required this.rating,
  });

  final String title;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppPalette.textPrimary,
          ),
        ),
        Gap(4.w),
        Expanded(
          child: LinearProgressIndicator(
            value: rating,
            minHeight: 5.h,
            backgroundColor: AppPalette.stroke.withOpacity(0.15),
            valueColor: const AlwaysStoppedAnimation<Color>(
              AppPalette.primary,
            ),
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
      ],
    );
  }
}
