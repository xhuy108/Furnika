import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';

class CategorySmallButton extends StatelessWidget {
  const CategorySmallButton({
    super.key,
    required this.title,
    this.isActive = false,
    this.onTap,
  });

  final String title;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(80.r),
        splashColor: AppPalette.primary.withOpacity(0.5),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 7.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(80.r),
            ),
            color: isActive
                ? AppPalette.primary
                : AppPalette.secondary.withOpacity(0.9),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              color: isActive ? AppPalette.lightText : AppPalette.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
