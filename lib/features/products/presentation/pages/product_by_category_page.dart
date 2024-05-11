import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/entities/category.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/common/widgets/app_text_field.dart';
import 'package:furnika/core/common/widgets/custom_back_button.dart';
import 'package:furnika/core/common/widgets/product_card_item.dart';
import 'package:furnika/features/products/domain/usecases/get_product_by_category.dart';
import 'package:furnika/features/products/presentation/bloc/product_bloc.dart';
import 'package:gap/gap.dart';

class ProductByCategoryPage extends StatefulWidget {
  const ProductByCategoryPage({super.key, required this.category});

  final Category category;

  @override
  State<ProductByCategoryPage> createState() => _ProductByCategoryPageState();
}

class _ProductByCategoryPageState extends State<ProductByCategoryPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context
        .read<ProductBloc>()
        .add(GetProductsByCategoryEvent(widget.category.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppPalette.background,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: const CustomBackButton(),
        ),
        leadingWidth: 56.w,
        title: Text(
          widget.category.name,
          style: TextStyle(
            fontSize: 18.sp,
            color: AppPalette.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 12.h,
        ),
        child: Column(
          children: [
            Row(
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
            Gap(20.h),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ProductsError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is ProductsLoaded) {
                    if (state.products.isEmpty) {
                      return const Center(
                        child: Text('No products found'),
                      );
                    }
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.h, // vertical spacing
                        crossAxisSpacing: 20.w,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ProductCardItem(product: state.products[index]);
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
