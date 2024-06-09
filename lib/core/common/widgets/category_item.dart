import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/routes/route_names.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/entities/category.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            if (category.name == "All") {
              context.pushNamed(RouteNames.category);
            } else {
              context.pushNamed(
                RouteNames.productByCategory,
                extra: category,
              );
            }
          },
          padding: EdgeInsets.all(15.r),
          style: IconButton.styleFrom(
            backgroundColor: AppPalette.secondary.withOpacity(0.9),
          ),
          icon: SvgPicture.network(
            category.icon,
          ),
        ),
        Gap(5.h),
        SizedBox(
          width: 60.w,
          child: Text(
            category.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppPalette.textPrimary,
              fontSize: 11.sp,
            ),
          ),
        ),
      ],
    );
  }
}
