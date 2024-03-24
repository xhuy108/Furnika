import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:furnika/core/common/widgets/app_text_field.dart';
import 'package:furnika/features/auth/presentation/widgets/auth_field_label.dart';
import 'package:furnika/features/auth/presentation/widgets/social_button.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 24,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                    const AuthFieldLabel(label: 'Name'),
                    SizedBox(
                      height: 7.h,
                    ),
                    AppTextField(
                      hintText: 'Name',
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const AuthFieldLabel(label: 'Email'),
                    SizedBox(
                      height: 7.h,
                    ),
                    AppTextField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const AuthFieldLabel(label: 'Password'),
                    SizedBox(
                      height: 7.h,
                    ),
                    AppTextField(
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      isObscureText: true,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const AuthFieldLabel(label: 'Confirm Password'),
                    SizedBox(
                      height: 7.h,
                    ),
                    AppTextField(
                      hintText: 'Confirm Password',
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      isObscureText: true,
                    ),
                    Gap(10.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          text: 'Agree with ',
                          style: GoogleFonts.lexend(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppPalette.textPrimary,
                          ),
                          children: [
                            TextSpan(
                              text: 'Terms & Condition',
                              style: GoogleFonts.lexend(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppPalette.primary,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  debugPrint('Terms & Condition');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    AppButton(
                      height: 46.h,
                      title: 'Sign Up',
                      onTap: () {},
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialButton(
                          icon: SvgPicture.asset(MediaResource.googleIcon),
                          onPressed: () {},
                        ),
                        SocialButton(
                          icon: SvgPicture.asset(MediaResource.facebookIcon),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Gap(
                      40.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: GoogleFonts.lexend(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppPalette.textPrimary,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: GoogleFonts.lexend(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppPalette.primary,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                debugPrint('Sign In');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
