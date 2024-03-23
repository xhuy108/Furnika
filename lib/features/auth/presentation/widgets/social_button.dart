import 'package:flutter/material.dart';
import 'package:furnika/config/themes/app_palette.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.icon, this.onPressed});

  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: IconButton.styleFrom(
        shape: CircleBorder(
          side: BorderSide(
            color: AppPalette.stroke.withOpacity(0.25),
          ),
        ),
      ),
    );
  }
}
