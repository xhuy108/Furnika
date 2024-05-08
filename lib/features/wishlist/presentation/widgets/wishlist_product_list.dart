import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/common/widgets/product_card_item.dart';

class WishlistProductList extends StatelessWidget {
  const WishlistProductList({super.key});

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
        itemCount: 16,
        itemBuilder: (context, index) {
          return ProductCardItem(
            product: Product(
              id: index.toString(),
              name: 'sofa',
              description: 'description',
              price: 1,
              imageCover:
                  'https://th.bing.com/th/id/OIP.yOoOlRkcBZmpRfP3AlPD4QHaEo?rs=1&pid=ImgDetMain',
              images: ['images'],
              category: ['category'],
            ),
          );
        },
      ),
    );
  }
}
