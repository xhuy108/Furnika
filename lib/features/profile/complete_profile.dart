import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resoures.dart';
import 'package:furnika/core/common/widgets/custom_text_field.dart';
import 'package:furnika/features/auth/presentation/widgets/auth_field_label.dart';
import 'package:gap/gap.dart';

class CompletePro5Page extends StatefulWidget {
  const CompletePro5Page({super.key});
  @override
  State<CompletePro5Page> createState() => _CompletePro5PageState();
}

class _CompletePro5PageState extends State<CompletePro5Page> {
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
                  Text(
                    'Complete Your Profile',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w400,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  Gap(12.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Don’t worry, only you can see your personal \n data. No one else will be able to see it',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppPalette.textSecondary,
                    ),
                  ),
                  Gap(40.h),
                  Container(
                    width: 104.w,
                    height: 104.h,
                    decoration: BoxDecoration(
                      color: AppPalette.textFieldBackground.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      MediaResource.profileIcon,
                      width: 48.w,
                      height: 48.h,
                    ),
                  ),
                  Gap(40.h),
                  const AuthFieldLabel(label: 'Name'),
                  Gap(7.h),
                  CustomTextField(
                    hintText: 'Name',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Gap(20.h),
                  const AuthFieldLabel(label: 'Phone Number'),
                  Gap(7.h),
                  CustomTextField(
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.visiblePassword,
                    isObscureText: true,
                  ),
                  Gap(20.h),
                  const AuthFieldLabel(label: 'Gender'),
                  Gap(7.h),
                  CustomTextField(
                    hintText: 'Gender',
                    keyboardType: TextInputType.visiblePassword,
                    isObscureText: true,
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
                        'Complete Profile',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppPalette.background,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
