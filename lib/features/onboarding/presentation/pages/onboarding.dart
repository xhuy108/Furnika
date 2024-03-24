import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/routes/route_names.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MediaResource.onBoardingBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'The Furniture App ',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 23.sp,
                          color: AppPalette.primary,
                          fontWeight: FontWeight.w400,
                        ),
                    children: const [
                      TextSpan(
                        text: 'That \n Elevates Your Home',
                        style: TextStyle(
                          color: AppPalette.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                Text(
                  'Welcome to the furniture shopping app, where we provide a convenient and diverse online shopping experience.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppPalette.textSecondary,
                    fontSize: 12.sp,
                  ),
                ),
                Gap(50.h),
                AppButton(
                  height: 46.h,
                  title: 'Let\'s Get Started',
                  onTap: () {
                    context.pushNamed(RouteNames.signUp);
                  },
                ),
                Gap(12.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12.sp,
                          color: AppPalette.textPrimary,
                          fontWeight: FontWeight.w400,
                        ),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: const TextStyle(
                          color: AppPalette.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed(RouteNames.login);
                          },
                      ),
                    ],
                  ),
                ),
                Gap(50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
