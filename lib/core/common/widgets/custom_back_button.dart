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
        ModalRoute.of(context)?.canPop;
      },
      icon: SvgPicture.asset(MediaResource.backIcon),
      style: IconButton.styleFrom(
        shape: CircleBorder(
          side: BorderSide(
            color: AppPalette.textSecondary.withOpacity(0.25),
          ),
        ),
      ),
    );
  }
}
