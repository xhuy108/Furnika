import 'package:flutter/cupertino.dart';
import 'package:furnika/config/themes/app_palette.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: AppPalette.stroke.withOpacity(0.15),
    );
  }
}
