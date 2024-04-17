import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.title,
    this.isActive = false,
    this.onTap,
  });

  final String icon;
  final String activeIcon;
  final String title;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isActive ? activeIcon : icon,
            height: 24.h,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: isActive
                  ? AppPalette.primary
                  : AppPalette.textThird.withOpacity(0.5),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
