import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resoures.dart';
import 'package:gap/gap.dart';

class InformationItem extends StatelessWidget {
  const InformationItem({super.key, required this.content, required this.icon});

  final String icon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.h,
            color: AppPalette.containerStroke.withOpacity(0.25),
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 40.h,
            width: 40.h,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(icon),
            ),
          ),
          Gap(10.h),
          Text(
            content,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: AppPalette.textPrimary,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(MediaResource.nextIcon),
              style: IconButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0), elevation: 2),
            ),
          ),
        ],
      ),
    );
  }
}
