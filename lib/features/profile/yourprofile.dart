import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/features/profile/widgets/info_items.dart';
import 'package:gap/gap.dart';

class YourProfilePage extends StatefulWidget {
  const YourProfilePage({super.key});
  @override
  State<YourProfilePage> createState() => _YourProfilePageState();
}

class _YourProfilePageState extends State<YourProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(children: [
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
                    Gap(72.w),
                    Text(
                      'Your Profile',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: AppPalette.textPrimary,
                      ),
                    ),
                  ],
                ),
                Gap(20.h),
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
                Gap(20.h),
                Text(
                  'Thanh Hien Tran',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppPalette.textPrimary,
                  ),
                ),
                Gap(30.h),
                InformationItem(
                    content: 'Your Information', icon: MediaResource.userIcon),
                InformationItem(
                    content: 'Manage Address',
                    icon: MediaResource.manageaddressIcon),
                InformationItem(
                    content: 'Payment Methods',
                    icon: MediaResource.paymentmethodIcon),
                InformationItem(
                    content: 'My Orders', icon: MediaResource.myordersIcon),
                InformationItem(
                    content: 'My Coupons', icon: MediaResource.mycouponsIcon),
                InformationItem(
                    content: 'Settings', icon: MediaResource.settingsIcon),
                InformationItem(
                    content: 'Help Center', icon: MediaResource.helpcenterIcon),
                InformationItem(
                    content: 'Privacy Policy', icon: MediaResource.privacyIcon),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
