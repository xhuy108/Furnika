import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/features/order/presentation/widgets/address_information.dart';
import 'package:gap/gap.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Checkout',
        context: context,
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 22.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: AppPalette.stroke.withOpacity(0.15),
              offset: const Offset(0, -1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppPalette.textSecondary,
                  ),
                ),
                Text(
                  '\$599.0',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppPalette.textPrimary,
                  ),
                ),
              ],
            ),
            AppButton(
              height: 46.h,
              width: 180.w,
              title: 'Pay Now',
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppPalette.background,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFE3DBDD).withOpacity(0.25),
                        offset: const Offset(5, 5),
                        blurRadius: 13,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AddressInformation(
                        title: 'Customer: ',
                        value: 'state.addresses',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: AddressInformation(
                          title: 'Phone number: ',
                          value: 'state.addresses',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: AddressInformation(
                          title: 'Street: ',
                          value: 'state.addresses',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: AddressInformation(
                          title: 'District: ',
                          value: 'state.addresse',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: AddressInformation(
                          title: 'City: ',
                          value: 'state.addre',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: AddressInformation(
                          title: 'Country: ',
                          value: 'state.addre',
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 18.h,
                  right: 24.w,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      MediaResource.editIcon,
                      color: Colors.black,
                      width: 14.w,
                      height: 14.h,
                    ),
                  ),
                ),
              ],
            ),
            Gap(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Text(
                    'Home Delivery',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
