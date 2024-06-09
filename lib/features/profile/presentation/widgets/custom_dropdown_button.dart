import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.value,
    this.hintText,
    this.validator,
    this.items,
    this.onChanged,
  });

  final dynamic value;
  final String? hintText;
  final String? Function(dynamic)? validator;
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      validator: validator,
      hint: Text(
        hintText ?? 'Select an item',
        style: TextStyle(
          color: AppPalette.textSecondary,
          fontSize: 11.sp,
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 11.sp,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
      ),
      items: items,
      onChanged: onChanged,
    );
  }
}
