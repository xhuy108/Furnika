import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnika/features/cart/domain/entities/cart_item_entity.dart';
import 'package:furnika/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:furnika/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_plus/icons_plus.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Slidable(
          key: ValueKey(cartItems[index].id),
          endActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  context.read<CartCubit>().removeProduct(
                        productId: cartItems[index].product.id,
                      );
                },
                backgroundColor: const Color(0xFFFFDCDC),
                foregroundColor: const Color(0xFFEE3F07),
                icon: Iconsax.trash_bold,
              ),
            ],
          ),
          child: CartItem(
            cartItemEntity: cartItems[index],
          ),
        );
      },
    );
  }
}
