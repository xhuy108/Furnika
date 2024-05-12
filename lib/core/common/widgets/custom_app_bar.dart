import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/custom_back_button.dart';

AppBar customAppBar({
  required String title,
  PreferredSizeWidget? bottom,
  required BuildContext context,
  List<Widget>? actions,
}) {
  return AppBar(
    leading: Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Navigator.of(context).canPop() ? const CustomBackButton() : null,
    ),
    leadingWidth: Navigator.of(context).canPop() ? 56.w : 0,
    centerTitle: Navigator.of(context).canPop(),
    title: Padding(
      padding: Navigator.of(context).canPop()
          ? EdgeInsets.zero
          : EdgeInsets.only(left: 10.w),
      child: Text(
        title,
        style: TextStyle(
          color: AppPalette.textPrimary,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    surfaceTintColor: AppPalette.background,
    backgroundColor: AppPalette.background,
    bottom: bottom,
    actions: actions,
  );
}
