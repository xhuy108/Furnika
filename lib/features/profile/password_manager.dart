import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resoures.dart';
import 'package:gap/gap.dart';

class PasswordManagerPage extends StatefulWidget {
  const PasswordManagerPage({super.key});
  @override
  State<PasswordManagerPage> createState() => _PasswordManagerPageState();
}
class _PasswordManagerPageState extends State<PasswordManagerPage> {
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
                    Gap(44.w),
                    Text(
                      'Password Manager',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: AppPalette.textPrimary,
                      ),
                    ),
                  ],
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