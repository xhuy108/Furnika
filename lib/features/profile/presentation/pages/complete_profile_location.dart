import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:gap/gap.dart';
import 'package:furnika/core/common/widgets/custom_back_button.dart';

class CompleteProfileLocationPage extends StatefulWidget {
  const CompleteProfileLocationPage({super.key});
  @override
  State<CompleteProfileLocationPage> createState() =>
      _CompleteProfileLocationPageState();
}

class _CompleteProfileLocationPageState
    extends State<CompleteProfileLocationPage> {
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
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CustomBackButton(),
                  ),
                  Gap(34.h),
                  Container(
                    width: 104.w,
                    height: 104.h,
                    padding: EdgeInsets.all(28.w),
                    decoration: BoxDecoration(
                      color: AppPalette.textFieldBackground.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      MediaResource.locationIcon,
                    ),
                  ),
                  Gap(40.h),
                  Text(
                    'What Is Your Location?',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w400,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  Gap(12.h),
                  Text(
                    textAlign: TextAlign.center,
                    'We need to know your location in order to suggest \n nearby service',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppPalette.textSecondary,
                    ),
                  ),
                  Gap(40.h),
                  AppButton(
                    title: 'Allow Location Access',
                    onTap: () {},
                  ),
                  Gap(20.h),
                  AppButton(
                    title: 'Enter Location Manually',
                    backgroundColor: AppPalette.background,
                    foregroundColor: AppPalette.primary,
                    onTap: () {},
                  ),
                  Gap(315.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
