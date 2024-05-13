import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/common/widgets/product_card_item.dart';

class WishlistProductList extends StatelessWidget {
  const WishlistProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 12.h,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.h, // vertical spacing
          crossAxisSpacing: 20.w,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCardItem(
            product: products[index],
          );
        },
      ),
    );
  }
}
