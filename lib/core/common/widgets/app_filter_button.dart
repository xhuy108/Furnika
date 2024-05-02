import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';

class AppFilterButton extends StatelessWidget {
  const AppFilterButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: SvgPicture.asset(
        MediaResource.filterIcon,
        width: 14.w,
        height: 14.h,
      ),
      style: IconButton.styleFrom(
        backgroundColor: AppPalette.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        fixedSize: Size(42.w, 42.h),
      ),
    );
  }
}
