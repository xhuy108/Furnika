import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.isObscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onTap,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool isObscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: isObscureText,
      style: TextStyle(
        fontSize: 11.sp,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 18.w,
          vertical: 12.h,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 11.sp,
        ),
      ),
      onTap: onTap,
    );
  }
}
