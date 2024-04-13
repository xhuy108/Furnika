import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:gap/gap.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          padding: EdgeInsets.all(15.r),
          style: IconButton.styleFrom(
            backgroundColor: AppPalette.secondary.withOpacity(0.9),
          ),
          icon: SvgPicture.asset(
            MediaResource.categoryIcon,
          ),
        ),
        Gap(5.h),
        Text(
          'Sofa',
          style: TextStyle(
            color: AppPalette.textPrimary,
            fontSize: 11.sp,
          ),
        ),
      ],
    );
  }
}
