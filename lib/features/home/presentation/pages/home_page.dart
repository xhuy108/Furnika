import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:furnika/core/common/widgets/app_text_field.dart';
import 'package:furnika/core/common/widgets/category_item.dart';
import 'package:furnika/features/home/presentation/widgets/category_small_button.dart';
import 'package:furnika/features/home/presentation/widgets/coupon_banner.dart';
import 'package:furnika/features/home/presentation/widgets/home_app_bar.dart';
import 'package:furnika/features/home/presentation/widgets/product_card_item.dart';
import 'package:furnika/features/home/presentation/widgets/tag_text.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  int currentPopularCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            Gap(21.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      hintText: 'Search...',
                      keyboardType: TextInputType.text,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(13.h),
                        child: SvgPicture.asset(
                          MediaResource.searchIcon,
                        ),
                      ),
                      controller: _searchController,
                    ),
                  ),
                  Gap(10.w),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      MediaResource.filterIcon,
                      width: 14.w,
                      height: 14.h,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: AppPalette.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      fixedSize: Size(42.w, 42.h),
                    ),
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CouponBanner(),
                    Gap(20.h),
                    const TagText(text: 'Category'),
                    Gap(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 20.h, // vertical spacing
                          crossAxisSpacing: 20.w,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: 8,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const CategoryItem();
                        },
                      ),
                    ),
                    Gap(20.h),
                    const TagText(text: 'Most Popular'),
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
                    Gap(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.h, // vertical spacing
                          crossAxisSpacing: 20.w,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: 8,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const ProductCardItem();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
