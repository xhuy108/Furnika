import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resoures.dart';
import 'package:furnika/core/common/widgets/custom_text_field.dart';
import 'package:furnika/features/auth/presentation/widgets/auth_field_label.dart';
import 'package:gap/gap.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w400,
                  color: AppPalette.textPrimary,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Fill your information below or register \n with your social account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppPalette.textSecondary,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              AuthFieldLabel(label: 'Name'),
              SizedBox(
                height: 7.h,
              ),
              CustomTextField(
                hintText: 'Name',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20.h,
              ),
              AuthFieldLabel(label: 'Email'),
              SizedBox(
                height: 7.h,
              ),
              CustomTextField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20.h,
              ),
              AuthFieldLabel(label: 'Password'),
               SizedBox(
                height: 7.h,
              ),
              CustomTextField(
                hintText: 'Password',
                keyboardType: TextInputType.emailAddress,
              ),
              Gap(
                    10.h,
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Agree with',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                   Gap(
                    6.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Terms & Condition',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppPalette.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppPalette.primary,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppPalette.background,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Text(
                'Or sign up with',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppPalette.textSecondary,
                ),
              ),
               Gap(
                50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(MediaResource.googleIcon),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            color: AppPalette.textSecondary.withOpacity(0.25)),
                      ),
                    ),
                  ),
                  const Gap(
                    15,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(MediaResource.facebookIcon),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            color: AppPalette.textSecondary.withOpacity(0.25)),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(
                40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                   Gap(
                    6.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppPalette.primary,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
