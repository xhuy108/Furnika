import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';

class AdjustQuantityButton extends StatelessWidget {
  const AdjustQuantityButton({
    super.key,
    this.onTap,
    required this.backgroundColor,
    required this.iconColor,
    required this.icon,
  });

  final void Function()? onTap;
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 12.sp,
        ),
      ),
    );
  }
}
