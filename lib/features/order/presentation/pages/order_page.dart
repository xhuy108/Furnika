import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/features/order/presentation/widgets/order_list.dart';
import 'package:furnika/features/order/presentation/widgets/order_product_card.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: customAppBar(
          title: 'My Orders',
          bottom: TabBar(
            indicatorColor: AppPalette.primary,
            labelColor: AppPalette.primary,
            unselectedLabelColor: AppPalette.textSecondary.withOpacity(0.7),
            splashBorderRadius: BorderRadius.circular(4.r),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3.h,
            tabs: const [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TabBarView(
            children: [
              const OrderList(),
              const OrderList(),
              const OrderList(),
            ],
          ),
        ),
      ),
    );
  }
}
