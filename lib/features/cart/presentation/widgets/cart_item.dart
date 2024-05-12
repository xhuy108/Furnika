import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/adjust_quanity_button.dart';
import 'package:furnika/core/utils/formatter.dart';
import 'package:furnika/features/cart/domain/entities/cart_item_entity.dart';
import 'package:furnika/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:gap/gap.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

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
                  image: DecorationImage(
                    image:
                        NetworkImage(widget.cartItemEntity.product.imageCover),
                    fit: BoxFit.fill,
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
                      widget.cartItemEntity.product.name,
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
                          currencyFormatter.format(
                            widget.cartItemEntity.product.price,
                          ),
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
                            context.read<CartCubit>().decreaseQuantity(
                                  product: widget.cartItemEntity.product,
                                );
                          },
                        ),
                        Gap(8.w),
                        Text(
                          widget.cartItemEntity.quantity.toString(),
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
                            context.read<CartCubit>().increaseQuantity(
                                  product: widget.cartItemEntity.product,
                                );
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
