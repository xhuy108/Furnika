import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:gap/gap.dart';

class FilterActionBottomBar extends StatelessWidget {
  const FilterActionBottomBar({super.key, this.onReset, this.onApply});

  final void Function()? onReset;
  final void Function()? onApply;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 12.h,
        bottom: 22.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
        color: AppPalette.background,
        boxShadow: [
          BoxShadow(
            color: AppPalette.shadow.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(4, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              title: 'Reset Filter',
              backgroundColor: AppPalette.textFieldBackground.withOpacity(0.9),
              foregroundColor: AppPalette.primary,
              onTap: onReset,
            ),
          ),
          Gap(20.w),
          Expanded(
            child: AppButton(
              title: 'Apply',
              onTap: onApply,
            ),
          ),
        ],
      ),
    );
  }
}
