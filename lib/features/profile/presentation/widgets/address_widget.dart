import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/features/profile/domain/entities/address.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    required this.address,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.onTap,
  });

  final Address address;
  final int value;
  final int groupValue;
  final void Function(int?)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(
        left: 18,
        top: 14,
        right: 5,
        bottom: 14,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppPalette.background,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD8D8D8).withOpacity(0.25),
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: null,
                icon: SvgPicture.asset(MediaResource.addressLocationIcon),
                style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFF4F4F4), elevation: 1),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      address.customer,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppPalette.textPrimary,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      address.phoneNumber,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFA9A6A6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: 220,
                  child: Text(
                    '${address.detailedAddress}, ${address.district}, ${address.city}, ${address.country}',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFA9A6A6),
                    ),
                  ),
                ),
                address.isDefault
                    ? Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppPalette.primary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Default',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppPalette.primary,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            const Spacer(),
            Radio<int>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
