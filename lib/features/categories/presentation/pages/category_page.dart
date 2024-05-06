import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/category_item.dart';
import 'package:furnika/core/common/widgets/custom_back_button.dart';
import 'package:furnika/features/categories/presentation/category_bloc/category_bloc.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(FetchOtherCategories());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: const CustomBackButton(),
        ),
        leadingWidth: 56.w,
        title: Text(
          'Categories',
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
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryInitial) {
              context.read<CategoryBloc>().add(FetchOtherCategories());
            }
            if (state is OtherCategoryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is OtherCategoryError) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is OtherCategoryLoaded) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 0.7,
                ),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(category: state.categories[index]);
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
