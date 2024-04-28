import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_text_field.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/features/profile/presentation/widgets/custom_label.dart';
import 'package:gap/gap.dart';

class PasswordManagementPage extends StatefulWidget {
  const PasswordManagementPage({super.key});
  @override
  State<PasswordManagementPage> createState() => _PasswordManagementPageState();
}

class _PasswordManagementPageState extends State<PasswordManagementPage> {
  final TextEditingController _currentPasswordController =
      TextEditingController();

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Password Manager'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 12.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomLabel(label: 'Current Password'),
              Gap(10.h),
              AppTextField(
                controller: _currentPasswordController,
                hintText: 'Current Password',
                keyboardType: TextInputType.visiblePassword,
                isObscureText: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    MediaResource.hidePasswordIcon,
                  ),
                ),
              ),
              Gap(10.h),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5.r),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: AppPalette.primary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Gap(20.h),
              const CustomLabel(label: 'New Password'),
              Gap(10.h),
              AppTextField(
                controller: _newPasswordController,
                hintText: 'New Password',
                keyboardType: TextInputType.visiblePassword,
                isObscureText: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    MediaResource.hidePasswordIcon,
                  ),
                ),
              ),
              Gap(15.h),
              const CustomLabel(label: 'Confirm New Password'),
              Gap(10.h),
              AppTextField(
                controller: _confirmNewPasswordController,
                hintText: 'Confirm New Password',
                keyboardType: TextInputType.visiblePassword,
                isObscureText: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    MediaResource.hidePasswordIcon,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
