import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/routes/route_names.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/core/constraints/constraints.dart';
import 'package:furnika/features/order/presentation/widgets/address_information.dart';
import 'package:furnika/features/order/presentation/widgets/checkout_product.dart';
import 'package:furnika/features/profile/data/models/address_model.dart';
import 'package:furnika/features/profile/presentation/cubit/address_cubit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

enum PaymentMethodEnum { cashOnDelivery, stripe }

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  PaymentMethodEnum paymentMethod = PaymentMethodEnum.cashOnDelivery;
  Map<String, dynamic>? paymentIntent;
  int shipCost = 30000;
  AddressModel? address;
  int? discountValue;

  @override
  void initState() {
    super.initState();
    context.read<AddressCubit>().fetchAllAddresses();
  }

  void makePayment(int amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount);

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'VN',
            currencyCode: 'vnd',
            testEnv: true,
          ),
          style: ThemeMode.dark,
          merchantDisplayName: 'Example Inc.',
          appearance: const PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: AppPalette.primary,
            ),
            primaryButton: PaymentSheetPrimaryButtonAppearance(
              colors: PaymentSheetPrimaryButtonTheme(
                light: PaymentSheetPrimaryButtonThemeColors(
                  background: AppPalette.primary,
                  text: AppPalette.textPrimary,
                ),
              ),
            ),
          ),
        ),
      );
      displayPaymentSheet();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void displayPaymentSheet() async {
    // try {
    //   await Stripe.instance.presentPaymentSheet();
    //   if (mounted) {
    //     if (widget.cart == 'cart') {
    //       BlocProvider.of<CartCubit>(context).emptyCartItem();
    //     }
    //     BlocProvider.of<OrderCubit>(context).emptyOrder();
    //     shipCost = 0;
    //     discountValue = 0;
    //     showDialog(
    //       context: context,
    //       builder: (ctx) {
    //         return const StatusDialog();
    //       },
    //     );
    //   }
    // } catch (e) {
    //   throw Exception(e.toString());
    // }
  }

  createPaymentIntent(int amount) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount.toString(),
        'currency': 'vnd',
      };

      final Dio dio = Dio();

      final response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: body,
        options: Options(headers: {
          'Authorization': 'Bearer $kStripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        }),
      );
      return json.decode(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

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
                  child: BlocBuilder<AddressCubit, AddressState>(
                    builder: (context, state) {
                      if (state is AddressLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is AddressFail) {
                        return Center(
                          child: Text(state.message),
                        );
                      }
                      if (state is! AddressesLoaded) {
                        return const Center(
                          child: Text('Something went wrong!'),
                        );
                      }
                      if (state.addresses.isEmpty) {
                        return const Text('No address yet!');
                      }

                      address = AddressModel(
                        id: state.addresses[0].id,
                        customer: state.addresses[0].customer,
                        phoneNumber: state.addresses[0].phoneNumber,
                        detailedAddress: state.addresses[0].detailedAddress,
                        district: state.addresses[0].district,
                        city: state.addresses[0].city,
                        country: state.addresses[0].country,
                      );

                      return Column(
                        children: [
                          AddressInformation(
                            title: 'Customer: ',
                            value: state.addresses[0].customer,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: AddressInformation(
                              title: 'Phone number: ',
                              value: state.addresses[0].phoneNumber,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: AddressInformation(
                              title: 'Street: ',
                              value: state.addresses[0].detailedAddress,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: AddressInformation(
                              title: 'District: ',
                              value: state.addresses[0].district,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: AddressInformation(
                              title: 'City: ',
                              value: state.addresses[0].city,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: AddressInformation(
                              title: 'Country: ',
                              value: state.addresses[0].country,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 18.h,
                  right: 24.w,
                  child: IconButton(
                    onPressed: () {
                      context.pushNamed(RouteNames.address);
                    },
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home Delivery',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  Gap(20.h),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return const CheckoutProduct();
                    },
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  Gap(20.h),
                  Row(
                    children: [
                      Text(
                        'Subtotal: ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppPalette.textSecondary,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$599.0',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppPalette.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          'Shipping fee: ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppPalette.textSecondary,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$5.0',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppPalette.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppPalette.textPrimary,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$599.0',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppPalette.textPrimary,
                          ),
                        ),
                      ],
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
