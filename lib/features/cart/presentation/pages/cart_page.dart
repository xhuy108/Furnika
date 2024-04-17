import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/custom_back_button.dart';
import 'package:furnika/features/cart/presentation/widgets/cart_item.dart';
import 'package:furnika/features/products/presentation/widgets/app_divider.dart';
import 'package:gap/gap.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: const CustomBackButton(),
        ),
        leadingWidth: 62.w,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(
            color: AppPalette.textPrimary,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        surfaceTintColor: AppPalette.background,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 12.h,
        ),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return CartItem();
          },
        ),
      ),
    );
  }
}
