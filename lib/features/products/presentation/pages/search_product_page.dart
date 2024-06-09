import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/entities/category.dart';
import 'package:furnika/core/common/widgets/app_text_field.dart';
import 'package:furnika/core/common/widgets/custom_back_button.dart';
import 'package:furnika/core/common/widgets/product_card_item.dart';
import 'package:furnika/features/products/presentation/bloc/product_bloc.dart';
import 'package:gap/gap.dart';

class SearchProductPage extends StatefulWidget {
  const SearchProductPage({super.key, required this.text});

  final String text;

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(SearchProductsByNameEvent(widget.text));
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
          'Search for ${widget.text}',
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
            if (state is SearchProductsSuccess) {
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
    );
  }
}
