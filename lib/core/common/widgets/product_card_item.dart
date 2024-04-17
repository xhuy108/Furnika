import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:gap/gap.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/product_img.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              top: 6.h,
              right: 6.w,
              child: IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                icon: SvgPicture.asset(
                  MediaResource.likeIcon,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
          ],
        ),
        Gap(6.h),
        Row(
          children: [
            Text(
              'Sofa',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppPalette.textPrimary,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              MediaResource.startIcon,
              width: 15.w,
              height: 15.h,
            ),
            Text(
              '4.5',
              style: TextStyle(
                fontSize: 11.sp,
                color: AppPalette.textSecondary,
              ),
            ),
          ],
        ),
        Gap(5.h),
        Text(
          'Price',
          style: TextStyle(
            fontSize: 12.sp,
            color: AppPalette.textPrimary,
          ),
        ),
      ],
    );
  }
}
