import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CouponBanner extends StatefulWidget {
  const CouponBanner({super.key});

  @override
  State<CouponBanner> createState() => _CouponBannerState();
}

class _CouponBannerState extends State<CouponBanner> {
  int _couponBannerActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _couponBannerActiveIndex = index;
              });
            },
          ),
          itemCount: 10,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
              image: const DecorationImage(
                image: AssetImage(MediaResource.couponBannerBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(MediaResource.couponImage),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'New Collection',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppPalette.textPrimary,
                        ),
                      ),
                      Gap(7.h),
                      Text(
                        'Discount 50% for the first order',
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: AppPalette.textSecondary,
                        ),
                      ),
                      Gap(10.h),
                      Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: AppButton(
                          height: 40.h,
                          title: 'Shop now',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(10.h),
        AnimatedSmoothIndicator(
          activeIndex: _couponBannerActiveIndex,
          count: 10,
          effect: WormEffect(
            activeDotColor: AppPalette.primary,
            dotHeight: 6.h,
            dotWidth: 6.w,
          ),
        ),
      ],
    );
  }
}
