import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/routes/route_names.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:furnika/core/common/widgets/app_filter_button.dart';
import 'package:furnika/core/common/widgets/app_text_field.dart';
import 'package:furnika/core/common/widgets/category_item.dart';
import 'package:furnika/core/common/widgets/option_button.dart';
import 'package:furnika/features/categories/presentation/all_categories_bloc/all_categories_bloc.dart';
import 'package:furnika/features/categories/presentation/category_bloc/category_bloc.dart';
import 'package:furnika/features/home/presentation/widgets/categories_list.dart';
import 'package:furnika/features/home/presentation/widgets/category_loader.dart';
import 'package:furnika/features/home/presentation/widgets/coupon_banner.dart';
import 'package:furnika/features/home/presentation/widgets/home_app_bar.dart';
import 'package:furnika/core/common/widgets/product_card_item.dart';
import 'package:furnika/features/home/presentation/widgets/option_loader.dart';
import 'package:furnika/features/home/presentation/widgets/tag_text.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  int currentPopularCategoryIndex = 0;
  final popularCategories = [];

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(FetchPopularCategories());
    context.read<AllCategoriesBloc>().add(FetchAllCategories());
  }

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
                  AppFilterButton(
                    onTap: () {
                      context.pushNamed(RouteNames.filter);
                    },
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
                      child: BlocConsumer<CategoryBloc, CategoryState>(
                        listener: (context, state) {
                          if (state is PopularCategoryLoaded) {
                            popularCategories.addAll(state.categories);
                          }
                        },
                        builder: (context, state) {
                          if (state is PopularCategoryLoading) {
                            return CategoriesList(
                              itemCount: 8,
                              itemBuilder: (_, index) => const CategoryLoader(),
                            );
                          }
                          if (state is PopularCategoryError) {
                            return Center(
                              child: Text(state.message),
                            );
                          }

                          return CategoriesList(
                            itemCount: popularCategories.length,
                            itemBuilder: (_, index) => CategoryItem(
                                category: popularCategories[index]),
                          );
                        },
                      ),
                    ),
                    Gap(20.h),
                    const TagText(text: 'Most Popular'),
                    Gap(20.h),
                    Container(
                      height: 32.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: BlocBuilder<AllCategoriesBloc, AllCategoriesState>(
                        builder: (context, state) {
                          if (state is AllCategoryLoading) {
                            return ListView.builder(
                              itemCount: 8,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return const OptionLoader();
                              },
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
                                  isActive:
                                      index == currentPopularCategoryIndex,
                                );
                              },
                            );
                          }
                          return const SizedBox();
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
