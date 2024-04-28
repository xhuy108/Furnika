import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/custom_back_button.dart';

AppBar customAppBar({
  required String title,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    leading: Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: const CustomBackButton(),
    ),
    leadingWidth: 62.w,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: AppPalette.textPrimary,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
    surfaceTintColor: AppPalette.background,
    backgroundColor: AppPalette.background,
    bottom: bottom,
  );
}
