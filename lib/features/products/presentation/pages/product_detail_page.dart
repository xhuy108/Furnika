import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:furnika/core/common/widgets/app_favorite_button.dart';
import 'package:furnika/core/common/widgets/custom_back_button.dart';
import 'package:furnika/core/common/widgets/product_card_item.dart';
import 'package:furnika/features/products/presentation/widgets/app_divider.dart';
import 'package:furnika/features/products/presentation/widgets/review_item.dart';
import 'package:gap/gap.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 22.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: AppPalette.stroke.withOpacity(0.15),
              offset: const Offset(0, -1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppPalette.textSecondary,
                  ),
                ),
                Text(
                  '\$ 250.00',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppPalette.textPrimary,
                  ),
                ),
              ],
            ),
            AppButton(
              height: 46.h,
              width: 180.w,
              title: 'Add to Cart',
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 360.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/product.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 32.h,
                  left: 20.w,
                  right: 20.w,
                  child: Row(
                    children: [
                      const CustomBackButton(),
                      const Spacer(),
                      AppFavoriteButton(
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 18.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Sofa',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppPalette.textSecondary.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Text(
                    'Solange Sofa',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  Gap(10.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        MediaResource.startIcon,
                        width: 16.w,
                        height: 16.h,
                      ),
                      Gap(5.w),
                      Text(
                        '(4.5)',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppPalette.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  Gap(15.h),
                  Text(
                    'Product Details',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  Gap(6.h),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppPalette.textSecondary,
                    ),
                  ),
                  Gap(15.h),
                  Text(
                    'Select Color',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  Gap(10.h),
                  Row(
                    children: [
                      Container(
                        height: 25.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Gap(10.w),
                      Container(
                        height: 25.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Gap(10.w),
                      Container(
                        height: 25.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Gap(15.h),
                  Row(
                    children: [
                      Text(
                        'Reviews',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppPalette.textPrimary,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppPalette.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '4.9',
                            style: TextStyle(
                              fontSize: 27.sp,
                              color: AppPalette.textPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gap(10.h),
                          RatingBar.builder(
                            initialRating: 3.5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            glow: false,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.only(right: 4.w),
                            itemSize: 28.w,
                            itemBuilder: (context, _) => SvgPicture.asset(
                              MediaResource.startIcon,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Gap(7.h),
                          Text(
                            '(250 reviews)',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppPalette.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 100.h,
                        width: 1,
                        color: AppPalette.stroke.withOpacity(0.15),
                      ),
                    ],
                  ),
                  Gap(15.h),
                  const AppDivider(),
                  ReviewItem(),
                  ReviewItem(),
                  Gap(15.h),
                  Text(
                    'More sofa',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppPalette.textPrimary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(10.h),
                  SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                        width: 150.w,
                        margin: EdgeInsets.only(right: 12.w),
                        child: ProductCardItem(),
                      ),
                    ),
                  ),
                  Gap(10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
