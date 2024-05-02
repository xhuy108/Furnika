import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).canPop()
            ? Navigator.of(context).pop()
            : Navigator.of(context).canPop;
      },
      icon: SvgPicture.asset(MediaResource.backIcon),
      style: IconButton.styleFrom(
        backgroundColor: AppPalette.background,
        shape: CircleBorder(
          side: BorderSide(
            color: AppPalette.textSecondary.withOpacity(0.25),
          ),
        ),
      ),
    );
  }
}
