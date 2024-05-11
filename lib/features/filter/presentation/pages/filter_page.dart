import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/option_button.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/features/filter/presentation/widgets/catalog_text.dart';
import 'package:furnika/features/filter/presentation/widgets/filter_bottom_action_bar.dart';
import 'package:furnika/features/filter/presentation/widgets/review_tile.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

enum SortType { all, popular, newest }

String formatSortType(SortType sortType) {
  switch (sortType) {
    case SortType.all:
      return 'All';
    case SortType.popular:
      return 'Popular';
    case SortType.newest:
      return 'Newest';
  }
}

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int _currentCategoryIndex = 0;
  int _sortIndex = 0;
  int _currentSubCategoryIndex = 0;
  SfRangeValues _currentRangeValues = const SfRangeValues(0, 400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Filter',
        context: context,
      ),
      bottomNavigationBar: FilterActionBottomBar(
        onReset: () {},
        onApply: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CatalogText(title: 'Category'),
                  Gap(15.h),
                  SizedBox(
                    height: 32.h,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OptionButton(
                          title: 'Sofa',
                          onTap: () {
                            setState(() {
                              _currentCategoryIndex = index;
                            });
                          },
                          isActive: index == _currentCategoryIndex,
                        );
                      },
                    ),
                  ),
                  Gap(20.h),
                  const CatalogText(title: 'Price Range'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: SfRangeSlider(
                min: 0,
                max: 400,
                values: _currentRangeValues,
                onChanged: (SfRangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
                activeColor: AppPalette.primary,
                inactiveColor: AppPalette.stroke.withOpacity(0.2),
                showLabels: true,
                interval: 50,
                numberFormat: NumberFormat('\$'),
                stepSize: 25,
                enableTooltip: true,
                tooltipShape: const SfPaddleTooltipShape(),
                tooltipTextFormatterCallback: (actualValue, formattedText) =>
                    '\$$actualValue',
              ),
            ),
            Gap(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CatalogText(title: 'Reviews'),
                  ReviewTile(
                    title: '4.5 and above',
                    rating: 5,
                  ),
                  Gap(10.h),
                  ReviewTile(
                    title: '4.0 - 4.5',
                    rating: 4,
                  ),
                  Gap(10.h),
                  ReviewTile(
                    title: '3.0 - 4.0',
                    rating: 3,
                  ),
                  Gap(10.h),
                  ReviewTile(
                    title: '2.0 - 3.0',
                    rating: 2,
                  ),
                  Gap(10.h),
                  ReviewTile(
                    title: '1.0 - 2.0',
                    rating: 1,
                  ),
                  Gap(5.h),
                  const CatalogText(title: 'Sort by'),
                  Gap(15.h),
                  SizedBox(
                    height: 32.h,
                    child: ListView.builder(
                      itemCount: SortType.values.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OptionButton(
                          title: formatSortType(SortType.values[index]),
                          onTap: () {
                            setState(() {
                              _sortIndex = index;
                            });
                          },
                          isActive: index == _sortIndex,
                        );
                      },
                    ),
                  ),
                  Gap(20.h),
                  const CatalogText(title: 'For'),
                  Gap(15.h),
                  SizedBox(
                    height: 32.h,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OptionButton(
                          title: 'Sofa',
                          onTap: () {
                            setState(() {
                              _currentSubCategoryIndex = index;
                            });
                          },
                          isActive: index == _currentSubCategoryIndex,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
