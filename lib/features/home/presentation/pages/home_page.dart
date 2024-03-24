import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_text_field.dart';
import 'package:gap/gap.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppPalette.textSecondary,
                            ),
                          ),
                          Gap(6.h),
                          Row(
                            children: [
                              SvgPicture.asset(
                                MediaResource.locationIcon,
                                width: 15.h,
                                height: 15.w,
                              ),
                              Gap(6.w),
                              Text(
                                'Ba Tri, Ben Tre',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppPalette.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          MediaResource.bellIcon,
                          width: 20.w,
                          height: 20.h,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor:
                              AppPalette.secondary.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(21.h),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          hintText: 'Search...',
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Gap(10.w),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          MediaResource.filterIcon,
                          width: 14.w,
                          height: 14.h,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor:
                              AppPalette.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(36.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
