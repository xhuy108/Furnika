import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnika/config/routes/route_names.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/utils/formatter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteNames.productDetail, extra: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: product.id,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(product.imageCover),
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 6.h,
                right: 6.w,
                child: IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  icon: SvgPicture.asset(
                    MediaResource.likeIcon,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
            ],
          ),
          Gap(6.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppPalette.textPrimary,
                  ),
                ),
              ),
              Gap(
                14.w,
              ),
              SvgPicture.asset(
                MediaResource.startIcon,
                width: 15.w,
                height: 15.h,
              ),
              Text(
                '4.5',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppPalette.textSecondary,
                ),
              ),
            ],
          ),
          Gap(5.h),
          Text(
            currencyFormatter.format(product.price),
            style: TextStyle(
              fontSize: 12.sp,
              color: AppPalette.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
