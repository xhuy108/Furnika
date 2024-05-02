import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/core/common/widgets/category_small_button.dart';
import 'package:furnika/features/wishlist/presentation/widgets/wishlist_product_list.dart';
import 'package:gap/gap.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  int currentPopularCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Wishlist',
        context: context,
      ),
      body: Column(
        children: [
          Gap(20.h),
          Container(
            height: 32.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategorySmallButton(
                  title: 'Sofa',
                  onTap: () {
                    setState(() {
                      currentPopularCategoryIndex = index;
                    });
                  },
                  isActive: index == currentPopularCategoryIndex,
                );
              },
            ),
          ),
          Gap(12.h),
          Expanded(
            child: WishlistProductList(),
          ),
        ],
      ),
    );
  }
}
