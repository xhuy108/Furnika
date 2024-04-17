import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:gap/gap.dart';

class InformationItem extends StatelessWidget {
  const InformationItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: () {
        print('object');
      },
      child: Container(
        width: double.infinity,
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.h,
              color: AppPalette.stroke.withOpacity(0.25),
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 24.w,
              height: 24.h,
            ),
            Gap(10.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: AppPalette.textPrimary,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              MediaResource.nextIcon,
              width: 20.w,
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
