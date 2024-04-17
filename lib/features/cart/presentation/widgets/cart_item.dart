import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/features/cart/presentation/widgets/adjust_quanity_button.dart';
import 'package:furnika/features/products/presentation/widgets/app_divider.dart';
import 'package:gap/gap.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppPalette.textSecondary.withOpacity(0.1),
            width: 1.h,
          ),
        ),
        color: AppPalette.background,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/product.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              Gap(25.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Emery Bed',
                      style: TextStyle(
                        color: AppPalette.textPrimary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(5.h),
                    Text(
                      'Price',
                      style: TextStyle(
                        color: AppPalette.textSecondary.withOpacity(0.7),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(12.h),
                    Row(
                      children: [
                        Text(
                          '\$200,0',
                          style: TextStyle(
                            color: AppPalette.textPrimary,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        AdjustQuantityButton(
                          backgroundColor:
                              AppPalette.textThird.withOpacity(0.15),
                          iconColor: AppPalette.textPrimary,
                          icon: Icons.remove,
                          onTap: () {
                            debugPrint('remove');
                          },
                        ),
                        Gap(8.w),
                        Text(
                          '1',
                          style: TextStyle(
                            color: AppPalette.textPrimary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Gap(8.w),
                        AdjustQuantityButton(
                          backgroundColor: AppPalette.primary,
                          iconColor: Colors.white,
                          icon: Icons.add,
                          onTap: () {
                            debugPrint('add');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
