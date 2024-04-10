import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:furnika/core/common/widgets/app_text_field.dart';
import 'package:furnika/core/common/widgets/custom_back_button.dart';
import 'package:furnika/features/auth/presentation/widgets/auth_field_label.dart';
import 'package:gap/gap.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});
  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CustomBackButton(),
                  ),
                  Gap(34.h),
                  Text(
                    'Complete Your Profile',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w400,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  Gap(12.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Don’t worry, only you can see your personal \n data. No one else will be able to see it',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppPalette.textSecondary,
                    ),
                  ),
                  Gap(40.h),
                  Container(
                    width: 104.w,
                    height: 104.h,
                    padding: EdgeInsets.all(28.w),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 242, 242, 1)
                          .withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      MediaResource.profileIcon,
                    ),
                  ),
                  Gap(40.h),
                  const AuthFieldLabel(label: 'Name'),
                  Gap(7.h),
                  AppTextField(
                    hintText: 'Name',
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                  ),
                  Gap(20.h),
                  const AuthFieldLabel(label: 'Phone Number'),
                  Gap(7.h),
                  AppTextField(
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    controller: _phoneNumberController,
                  ),
                  Gap(20.h),
                  const AuthFieldLabel(label: 'Gender'),
                  Gap(7.h),
                  AppTextField(
                    hintText: 'Gender',
                    keyboardType: TextInputType.name,
                  ),
                  Gap(40.h),
                  AppButton(
                    height: 50.h,
                    title: 'Complete Profile',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
