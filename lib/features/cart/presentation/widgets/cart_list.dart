import 'dart:math';

import 'package:flutter/material.dart';
import 'package:furnika/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_plus/icons_plus.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return Slidable(
          key: ValueKey(Random()),
          endActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  print('delete');
                },
                backgroundColor: const Color(0xFFFFDCDC),
                foregroundColor: Color(0xFFEE3F07),
                icon: Iconsax.trash_bold,
              ),
            ],
          ),
          child: CartItem(),
        );
      },
    );
  }
}
