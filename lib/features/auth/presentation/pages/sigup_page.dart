import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resoures.dart';
import 'package:furnika/core/common/widgets/custom_text_field.dart';
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
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: AppPalette.textPrimary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Fill your information below or register \n with your social account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppPalette.textSecondary,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppPalette.textPrimary,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              CustomTextField(
                hintText: 'Name',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppPalette.textPrimary,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              CustomTextField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppPalette.textPrimary,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              CustomTextField(
                hintText: 'Password',
                keyboardType: TextInputType.emailAddress,
              ),
              const Gap(
                    10,
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Agree with',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  const Gap(
                    6,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Terms & Condition',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppPalette.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppPalette.primary,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppPalette.background,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                'Or sign up with',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppPalette.textSecondary,
                ),
              ),
              const Gap(
                50,
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
              const Gap(
                40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  const Gap(
                    6,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 15,
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
