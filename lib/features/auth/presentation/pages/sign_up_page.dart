import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/routes/route_names.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:furnika/core/common/widgets/app_loading_indicator.dart';
import 'package:furnika/core/common/widgets/app_text_field.dart';
import 'package:furnika/core/common/widgets/text_field_label.dart';
import 'package:furnika/core/utils/show_snackbar.dart';
import 'package:furnika/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:furnika/features/auth/presentation/widgets/social_button.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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
  final _confirmPasswordController = TextEditingController();
  bool isAgreed = false;

  void _onSignUp() {
    if (_formKey.currentState!.validate()) {
      if (!isAgreed) {
        showSnackbar(
          context: context,
          message: 'Please agree with Terms & Condition',
          color: AppPalette.primary,
        );
      } else {
        context.read<AuthBloc>().add(
              AuthSignUp(
                email: _emailController.text,
                password: _passwordController.text,
                username: _nameController.text,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  showDialog(
                    context: context,
                    builder: (_) => const AppLoadingIndicator(),
                  );
                }
                if (state is AuthFailure) {
                  Navigator.pop(context);
                  showSnackbar(
                    context: context,
                    message: state.message,
                    color: AppPalette.error,
                  );
                }
                if (state is AuthSuccess) {
                  Navigator.pop(context);
                  context.goNamed(RouteNames.login);
                }
              },
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 32.h,
                  ),
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
                      const TextFieldLabel(label: 'Name'),
                      SizedBox(
                        height: 7.h,
                      ),
                      AppTextField(
                        hintText: 'Name',
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const TextFieldLabel(label: 'Email'),
                      SizedBox(
                        height: 7.h,
                      ),
                      AppTextField(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const TextFieldLabel(label: 'Password'),
                      SizedBox(
                        height: 7.h,
                      ),
                      AppTextField(
                        hintText: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        isObscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const TextFieldLabel(label: 'Confirm Password'),
                      SizedBox(
                        height: 7.h,
                      ),
                      AppTextField(
                        hintText: 'Confirm Password',
                        keyboardType: TextInputType.visiblePassword,
                        controller: _confirmPasswordController,
                        isObscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm Password is required';
                          }
                          if (value != _passwordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.9,
                            child: Checkbox(
                                checkColor: Colors.white,
                                activeColor: AppPalette.primary,
                                value: isAgreed,
                                onChanged: (value) {
                                  setState(() {
                                    isAgreed = value!;
                                  });
                                }),
                          ),
                          RichText(
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
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      AppButton(
                        height: 46.h,
                        title: 'Sign Up',
                        onTap: _onSignUp,
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
                                  context.pushNamed(RouteNames.login);
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
      ),
    );
  }
}
