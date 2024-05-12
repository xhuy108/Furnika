import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/routes/route_names.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OrderProductCard extends StatelessWidget {
  const OrderProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(RouteNames.orderDetail);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppPalette.stroke.withOpacity(0.15),
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: const DecorationImage(
                  image: AssetImage('assets/images/order_product.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(25.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Cammy Table',
                    style: TextStyle(
                      color: AppPalette.textPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(5.h),
                  Text(
                    'Sofa | Qty. : 01 pcs',
                    style: TextStyle(
                      color: AppPalette.textSecondary.withOpacity(0.7),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(12.h),
                  Row(
                    children: [
                      Text(
                        '\$ 180,0',
                        style: TextStyle(
                          color: AppPalette.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      AppButton(
                        height: 28.h,
                        width: 90.w,
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        title: 'Leave Review',
                        fontSize: 10.sp,
                        onTap: () {
                          print('product');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
