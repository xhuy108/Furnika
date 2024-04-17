import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/core/common/widgets/custom_back_button.dart';
import 'package:furnika/features/cart/presentation/widgets/cart_item.dart';
import 'package:furnika/features/cart/presentation/widgets/cart_list.dart';
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
      appBar: customAppBar(title: 'My Cart'),
      body: CartList(),
    );
  }
}
