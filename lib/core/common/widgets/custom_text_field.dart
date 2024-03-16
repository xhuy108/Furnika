import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.isObscureText = false,
    this.validator,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool isObscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: isObscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 18.w,
          vertical: 12.h,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 11.sp,
        ),
      ),
    );
  }
}
