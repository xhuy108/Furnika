import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/features/coupon/presentation/widgets/ticket_clipper.dart';
import 'package:gap/gap.dart';

class TicketWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final double value;

  const TicketWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 12.h,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppPalette.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    bottomLeft: Radius.circular(8.r),
                  ),
                  border: Border(
                    right: BorderSide(
                      color: AppPalette.stroke,
                      width: 1.w,
                      style: BorderStyle.none,
                    ),
                    bottom: BorderSide(
                      color: AppPalette.stroke,
                      width: 1.w,
                    ),
                    top: BorderSide(
                      color: AppPalette.stroke,
                      width: 1.w,
                    ),
                    left: BorderSide(
                      color: AppPalette.stroke,
                      width: 1.w,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WELCOME2024',
                      style: TextStyle(
                        color: AppPalette.textPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(5.h),
                    Text(
                      'Add items worth \$2 more to unlock',
                      style: TextStyle(
                        color: AppPalette.textSecondary,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(5.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          MediaResource.couponIcon,
                          width: 20.w,
                        ),
                        Gap(5.w),
                        Text(
                          'Get 50% OFF',
                          style: TextStyle(
                            color: AppPalette.textPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 51.5.h),
                decoration: BoxDecoration(
                  color: AppPalette.background,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                  ),
                  border: Border.all(
                    color: AppPalette.stroke,
                    width: 1.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
