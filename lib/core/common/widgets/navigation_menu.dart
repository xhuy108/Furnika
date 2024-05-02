import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/cubits/navigation/navigation_cubit.dart';
import 'package:furnika/core/common/widgets/navigation_item.dart';
import 'package:furnika/features/cart/presentation/pages/cart_page.dart';
import 'package:furnika/features/chat/presentation/pages/chat_page.dart';
import 'package:furnika/features/home/presentation/pages/home_page.dart';
import 'package:furnika/features/profile/presentation/pages/account_profile_page.dart';
import 'package:furnika/features/wishlist/presentation/pages/wishlist_page.dart';

List<Widget> pages = [
  HomePage(),
  CartPage(),
  WishListPage(),
  ChatPage(),
  AccountProfilePage(),
];

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          color: AppPalette.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: BlocBuilder<NavigationCubit, int>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationItem(
                  icon: MediaResource.homeIcon,
                  activeIcon: MediaResource.activeHomeIcon,
                  title: 'Home',
                  isActive: state == 0,
                  onTap: () {
                    context.read<NavigationCubit>().selectItem(0);
                  },
                ),
                NavigationItem(
                  icon: MediaResource.cartIcon,
                  activeIcon: MediaResource.activeCartIcon,
                  title: 'Cart',
                  isActive: state == 1,
                  onTap: () {
                    context.read<NavigationCubit>().selectItem(1);
                  },
                ),
                NavigationItem(
                  icon: MediaResource.wishlistIcon,
                  activeIcon: MediaResource.activeWishlistIcon,
                  title: 'Wishlist',
                  isActive: state == 2,
                  onTap: () {
                    context.read<NavigationCubit>().selectItem(2);
                  },
                ),
                NavigationItem(
                  icon: MediaResource.chatIcon,
                  activeIcon: MediaResource.activeChatIcon,
                  title: 'Chat',
                  isActive: state == 3,
                  onTap: () {
                    context.read<NavigationCubit>().selectItem(3);
                  },
                ),
                NavigationItem(
                  icon: MediaResource.accountIcon,
                  activeIcon: MediaResource.activeAccountIcon,
                  title: 'Account',
                  isActive: state == 4,
                  onTap: () {
                    context.read<NavigationCubit>().selectItem(4);
                  },
                ),
              ],
            );
          },
        ),
      ),
      body: pages[context.watch<NavigationCubit>().state],
    );
  }
}
