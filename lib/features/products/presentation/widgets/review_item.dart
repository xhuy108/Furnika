import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_divider.dart';
import 'package:gap/gap.dart';

import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/ava.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gap(8.w),
                  Text(
                    'Hien Thanh',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '11 months ago',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppPalette.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Gap(10.h),
          Text(
            'This sofa utilizes premium foam cushions, providing a gentle and comfortable sitting experience. This is particularly crucial if you seek moments of relaxation after a stressful day of work.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 11.sp,
              color: AppPalette.textSecondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          Gap(5.h),
          Row(
            children: [
              RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                glow: false,
                ignoreGestures: true,
                itemCount: 5,
                itemPadding: EdgeInsets.only(right: 4.w),
                itemSize: 16.w,
                itemBuilder: (context, _) => SvgPicture.asset(
                  MediaResource.startIcon,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Gap(5.w),
              Text(
                '(5.0)',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppPalette.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.h, // vertical spacing
              crossAxisSpacing: 10.w,
              childAspectRatio: 0.8,
            ),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                height: 150.h,
                width: 150.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/product.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              );
            },
          ),
          Gap(15.h),
          const AppDivider(),
        ],
      ),
    );
  }
}
