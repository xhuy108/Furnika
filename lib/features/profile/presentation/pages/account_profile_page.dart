import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/features/profile/presentation/widgets/infomation_item.dart';
import 'package:gap/gap.dart';

class AccountProfilePage extends StatefulWidget {
  const AccountProfilePage({super.key});
  @override
  State<AccountProfilePage> createState() => _AccountProfilePageState();
}

class _AccountProfilePageState extends State<AccountProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Your Profile'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20.h),
            Container(
              width: 104.w,
              height: 104.h,
              padding: EdgeInsets.all(28.h),
              decoration: BoxDecoration(
                color: AppPalette.textFieldBackground.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                MediaResource.profileIcon,
              ),
            ),
            Gap(20.h),
            Text(
              'Thanh Hien Tran',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: AppPalette.textPrimary,
              ),
            ),
            Gap(30.h),
            InformationItem(
              title: 'Your Information',
              icon: MediaResource.userIcon,
              onTap: () {},
            ),
            InformationItem(
              title: 'Manage Address',
              icon: MediaResource.manageAddressIcon,
              onTap: () {},
            ),
            InformationItem(
              title: 'Payment Methods',
              icon: MediaResource.paymentMethodIcon,
              onTap: () {},
            ),
            InformationItem(
              title: 'My Orders',
              icon: MediaResource.myOrdersIcon,
              onTap: () {},
            ),
            InformationItem(
              title: 'My Coupons',
              icon: MediaResource.myCouponsIcon,
              onTap: () {},
            ),
            InformationItem(
              title: 'Settings',
              icon: MediaResource.settingsIcon,
              onTap: () {},
            ),
            InformationItem(
              title: 'Help Center',
              icon: MediaResource.helpCenterIcon,
              onTap: () {},
            ),
            InformationItem(
              title: 'Privacy Policy',
              icon: MediaResource.privacyIcon,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
