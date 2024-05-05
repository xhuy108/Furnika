import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:furnika/config/routes/route_names.dart';
import 'package:furnika/core/utils/user_service.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';

import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:furnika/core/common/widgets/app_text_field.dart';

import 'package:furnika/core/common/widgets/text_field_label.dart';
import 'package:furnika/features/auth/presentation/widgets/social_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 32.h,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w400,
                        color: AppPalette.textPrimary,
                      ),
                    ),
                    Gap(12.h),
                    Text(
                      'Hi! Welcome back, you’ve been missed',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppPalette.textSecondary,
                      ),
                    ),
                    Gap(40.h),
                    const TextFieldLabel(label: 'Email'),
                    Gap(7.h),
                    AppTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Gap(20.h),
                    const TextFieldLabel(label: 'Password'),
                    Gap(7.h),
                    AppTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      isObscureText: true,
                    ),
                    Gap(10.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppPalette.primary,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    Gap(34.h),
                    AppButton(
                      height: 46.sp,
                      title: 'Log In',
                      onTap: () {},
                    ),
                    Gap(60.h),
                    Text(
                      'Or sign in with',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppPalette.textSecondary,
                      ),
                    ),
                    Gap(50.h),
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
                    Gap(50.h),
                    RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: GoogleFonts.lexend(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppPalette.textPrimary,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: GoogleFonts.lexend(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppPalette.primary,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(RouteNames.signUp);
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
