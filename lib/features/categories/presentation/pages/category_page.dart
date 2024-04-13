import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/category_item.dart';
import 'package:furnika/core/common/widgets/custom_back_button.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: CustomBackButton(),
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 20.h,
            childAspectRatio: 0.8,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return CategoryItem();
          },
        ),
      ),
    );
  }
}
