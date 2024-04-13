import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/features/profile/presentation/widgets/info_items.dart';
import 'package:gap/gap.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
                      Gap(84.w),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: AppPalette.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Gap(20.h),
                  InformationItem(
                      content: 'Notification Settings ',
                      icon: MediaResource.notificationsettingIcon),
                  InformationItem(
                      content: 'Password Manager ',
                      icon: MediaResource.passwordmanageIcon),
                  InformationItem(
                      content: 'Delete Account ',
                      icon: MediaResource.deleteaccountIcon),
                  Gap(549.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
