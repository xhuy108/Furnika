import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/core/common/widgets/option_button.dart';
import 'package:furnika/features/categories/presentation/all_categories_bloc/all_categories_bloc.dart';
import 'package:furnika/features/categories/presentation/category_bloc/category_bloc.dart';
import 'package:furnika/features/wishlist/presentation/cubit/wishlist_cubit.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Wishlist',
        context: context,
      ),
      body: Column(
        children: [
          Container(
            height: 32.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<AllCategoriesBloc, AllCategoriesState>(
              builder: (context, state) {
                if (state is AllCategoryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is AllCategoryError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                if (state is AllCategoryLoaded) {
                  return ListView.builder(
                    itemCount: state.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return OptionButton(
                        title: state.categories[index].name,
                        onTap: () {
                          setState(() {
                            currentPopularCategoryIndex = index;
                          });
                        },
                        isActive: index == currentPopularCategoryIndex,
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          Gap(12.h),
          Expanded(
            child: BlocBuilder<WishlistCubit, WishlistState>(
              builder: (context, state) {
                if (state is WishlistLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is WishlistFailure) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                if (state is WishlistSuccess) {
                  if (state.products.isEmpty) {
                    return const Center(
                      child: Text('No items in wishlist'),
                    );
                  }
                  return WishlistProductList(
                    products: state.products,
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
