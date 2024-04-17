import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnika/config/themes/media_resources.dart';

class AppFavoriteButton extends StatelessWidget {
  const AppFavoriteButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      icon: SvgPicture.asset(
        MediaResource.likeIcon,
        width: 20.w,
        height: 20.h,
      ),
    );
  }
}
