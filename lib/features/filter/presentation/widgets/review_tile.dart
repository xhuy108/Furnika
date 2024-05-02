import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:gap/gap.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key, required this.title, required this.rating});

  final double rating;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          glow: false,
          ignoreGestures: true,
          itemCount: 5,
          itemPadding: EdgeInsets.only(right: 4.w),
          itemSize: 24.w,
          itemBuilder: (context, _) => SvgPicture.asset(
            MediaResource.startIcon,
          ),
          onRatingUpdate: (rating) {},
        ),
        Gap(10.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppPalette.textPrimary,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        Radio(
          value: 1,
          groupValue: 1,
          activeColor: AppPalette.primary,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
