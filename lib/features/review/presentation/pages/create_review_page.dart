import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_divider.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/features/order/presentation/widgets/order_product_card.dart';
import 'package:furnika/features/review/presentation/widgets/bottom_action_bar.dart';
import 'package:gap/gap.dart';

class CreateReviewPage extends StatefulWidget {
  const CreateReviewPage({super.key});

  @override
  State<CreateReviewPage> createState() => _CreateReviewPageState();
}

class _CreateReviewPageState extends State<CreateReviewPage> {
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Leave Review'),
      bottomNavigationBar: BottomActionBar(
        onCancel: () {},
        onSubmit: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OrderProductCard(),
              Gap(10.h),
              Text(
                'Your overall rating',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: AppPalette.textSecondary.withOpacity(0.7),
                ),
              ),
              Gap(10.h),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                maxRating: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.only(right: 4.w),
                itemBuilder: (context, _) => SvgPicture.asset(
                  MediaResource.startIcon,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Gap(15.h),
              const AppDivider(),
              Gap(15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Add detailed review',
                  style: TextStyle(
                    color: AppPalette.textPrimary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(10.h),
              TextFormField(
                maxLines: 5,
                controller: _reviewController,
                decoration: InputDecoration(
                  filled: false,
                  hintText: 'Enter here',
                  hintStyle: const TextStyle(
                    color: AppPalette.primary,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppPalette.stroke.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              Gap(15.h),
              GestureDetector(
                onTap: () {
                  print('review');
                },
                child: Row(
                  children: [
                    SvgPicture.asset(MediaResource.cameraIcon),
                    Gap(8.w),
                    Text(
                      'Add Photo',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppPalette.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
