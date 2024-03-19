import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resoures.dart';
import 'package:gap/gap.dart';

class CompleteLocationPage extends StatefulWidget {
    const CompleteLocationPage({super.key});
  @override
  State<CompleteLocationPage> createState() => _CompleteLocationPageState();

}
class _CompleteLocationPageState extends State<CompleteLocationPage> {
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(MediaResource.backIcon),
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color:
                                    AppPalette.textSecondary.withOpacity(0.25)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(34.h),
                  Container(
                    width: 104.w,
                    height: 104.h,
                    decoration: BoxDecoration(
                      color: AppPalette.textFieldBackground.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      MediaResource.locationIcon,
                      width: 48.w,
                      height: 48.h,
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
                  Container(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppPalette.primary,
                      ),
                      child: Text(
                        'Allow Loation Access',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppPalette.background,
                        ),
                      ),
                    ),
                  ),
                  Gap(20.h),
                  Container(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        'Enter Location Manually',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppPalette.primary,
                        ),
                      ),
                    ),
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