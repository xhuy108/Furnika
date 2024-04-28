import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/features/order/presentation/widgets/detail_list_tile.dart';
import 'package:furnika/features/order/presentation/widgets/horizontal_line.dart';
import 'package:furnika/features/order/presentation/widgets/order_list.dart';
import 'package:gap/gap.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Track Order'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OrderList(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
              Gap(20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Order Details',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppPalette.primary,
                  ),
                ),
              ),
              Gap(10.h),
              const DetailListTile(
                title: 'Order Date',
                value: 'Jan 2, 2024 | 10:20 AM',
              ),
              Gap(10.h),
              const DetailListTile(
                title: 'Promo code',
                value: 'HGYJBGJAB',
              ),
              Gap(10.h),
              const DetailListTile(
                title: 'Payment method',
                value: 'Cash on delivery',
              ),
              Gap(10.h),
              const DetailListTile(
                title: 'Tracking ID',
                value: 'MI479086543358',
              ),
              Gap(20.h),
              const HorizontalLine(),
              Gap(15.h),
              const DetailListTile(
                title: 'Amount',
                value: '\$ 300.00',
              ),
              Gap(10.h),
              const DetailListTile(
                title: 'Delivery charge',
                value: '\$ 25.00',
              ),
              Gap(10.h),
              const DetailListTile(
                title: 'Discount',
                value: '\$ 25.00',
              ),
              Gap(10.h),
              Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      color: AppPalette.textPrimary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$ 300.00',
                    style: TextStyle(
                      color: AppPalette.textPrimary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Gap(20.h),
              const HorizontalLine(),
              Gap(20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Order Status',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppPalette.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
