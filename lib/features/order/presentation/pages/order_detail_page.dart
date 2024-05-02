import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/features/order/presentation/widgets/detail_list_tile.dart';
import 'package:furnika/features/order/presentation/widgets/horizontal_line.dart';
import 'package:furnika/features/order/presentation/widgets/order_list.dart';
import 'package:furnika/features/order/presentation/widgets/order_timeline_tile.dart';
import 'package:gap/gap.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Track Order', context: context,),
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
              //Star timeline
              OrderTimelineTile(
                isFirst: true,
                isCompleted: true,
                title: 'Order Placed',
                value: '2 Jan 2024, 04:35 PM',
                icon: MediaResource.orderPlacedIcon,
              ),

              //Middle timeline
              OrderTimelineTile(
                isCompleted: true,
                title: 'In Progress',
                value: '2 Jan 2024, 04:35 PM',
                icon: MediaResource.orderPackagedIcon,
              ),
              OrderTimelineTile(
                isCompleted: true,
                title: 'Shipped',
                value: '2 Jan 2024, 04:35 PM',
                icon: MediaResource.orderShippedIcon,
              ),

              //End timeline
              OrderTimelineTile(
                isLast: true,
                title: 'Delivery',
                value: '2 Jan 2024, 04:35 PM',
                icon: MediaResource.orderDeliveryIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
