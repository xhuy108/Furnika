import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/features/order/presentation/widgets/event_tile.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTimelineTile extends StatelessWidget {
  const OrderTimelineTile({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    this.isCompleted = false,
    required this.title,
    required this.value,
    required this.icon,
  });

  final bool isFirst;
  final bool isLast;
  final bool isCompleted;
  final String title;
  final String value;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isCompleted ? AppPalette.primary : const Color(0xFFE8E8E8),
        ),
        indicatorStyle: IndicatorStyle(
          width: 24.w,
          color: isCompleted ? AppPalette.primary : const Color(0xFFE8E8E8),
          iconStyle: IconStyle(
            color: Colors.white,
            iconData: Icons.done_rounded,
          ),
        ),
        endChild: EventTile(
          title: title,
          value: value,
          icon: icon,
        ),
      ),
    );
  }
}
