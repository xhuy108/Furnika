import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/core/utils/get_vietnam_provinces.dart';
import 'package:furnika/features/profile/domain/entities/address.dart';
import 'package:furnika/features/profile/presentation/cubit/address_cubit.dart';
import 'package:furnika/features/profile/presentation/widgets/address_sheet.dart';
import 'package:furnika/features/profile/presentation/widgets/address_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressPage extends StatefulWidget {
  const UserAddressPage({super.key});

  @override
  State<UserAddressPage> createState() => _UserAddressPageState();
}

class _UserAddressPageState extends State<UserAddressPage> {
  int selectedAddress = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    context.read<AddressCubit>().fetchAllAddresses();
  }

  void showAddressModal(Address? address) async {
    setState(() {
      isLoading = true;
    });
    if (isLoading) {
      showDialog(
        context: context,
        builder: (ctx) => const Center(
          child: CircularProgressIndicator(
            color: AppPalette.primary,
          ),
        ),
      );
    }

    final cities = await getCities();

    if (!mounted) {
      return;
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) => AddressSheet(
        cities: cities,
        address: address,
      ),
    );
    setState(() {
      isLoading = false;
    });

    if (!isLoading) {
      if (!mounted) {
        return;
      }
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Address', context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<AddressCubit, AddressState>(
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
                  return const Center(
                    child: Text('No address yet! Please add address!'),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.addresses.length,
                    itemBuilder: (ctx, index) {
                      return AddressWidget(
                        key: ValueKey(state.addresses[index].id),
                        address: state.addresses[index],
                        value: index,
                        groupValue: selectedAddress,
                        onChanged: (value) {
                          setState(() {
                            context
                                .read<AddressCubit>()
                                .reOrderAddresses(index);
                          });
                        },
                        onTap: () {
                          showAddressModal(state.addresses[index]);
                        },
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Iconsax.add,
                color: AppPalette.textPrimary,
                weight: 2,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE3E3E3),
                disabledBackgroundColor: AppPalette.primary.withOpacity(0.5),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                showAddressModal(null);
              },
              label: Text(
                'Add Address',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppPalette.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
