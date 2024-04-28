import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/features/order/presentation/widgets/order_product_card.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key, this.shrinkWrap = false, this.physics});

  final bool shrinkWrap;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: 3,
      itemBuilder: (context, index) => const OrderProductCard(),
    );
  }
}
