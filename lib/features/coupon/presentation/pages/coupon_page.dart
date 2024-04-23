import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/features/coupon/presentation/widgets/coupon_ticket.dart';

class CouponPage extends StatefulWidget {
  const CouponPage({super.key});

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Coupons'),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const TicketWidget(
            title: 'DAFS',
            subtitle: 'ASDFAD',
            value: 50,
          );
        },
      ),
    );
  }
}
