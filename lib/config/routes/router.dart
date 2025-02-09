import 'package:flutter/material.dart';
import 'package:furnika/core/common/entities/category.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/common/entities/user.dart';
import 'package:furnika/core/common/widgets/navigation_menu.dart';
import 'package:furnika/core/utils/check_is_first_time.dart';
import 'package:furnika/core/utils/injection_container.dart';
import 'package:furnika/core/utils/user_service.dart';
import 'package:furnika/features/auth/presentation/pages/log_in_page.dart';
import 'package:furnika/features/auth/presentation/pages/sign_up_page.dart';
import 'package:furnika/features/cart/presentation/pages/cart_page.dart';
import 'package:furnika/features/categories/presentation/pages/category_page.dart';
import 'package:furnika/features/chat/presentation/pages/chat_page.dart';
import 'package:furnika/features/chat/presentation/pages/detailed_chat_page.dart';
import 'package:furnika/features/coupon/presentation/pages/coupon_page.dart';
import 'package:furnika/features/filter/presentation/pages/filter_page.dart';
import 'package:furnika/features/home/presentation/pages/home_page.dart';
import 'package:furnika/features/onboarding/presentation/pages/onboarding.dart';
import 'package:furnika/features/order/presentation/pages/checkout_page.dart';
import 'package:furnika/features/order/presentation/pages/order_detail_page.dart';
import 'package:furnika/features/order/presentation/pages/order_page.dart';
import 'package:furnika/features/products/presentation/pages/product_by_category_page.dart';
import 'package:furnika/features/products/presentation/pages/product_detail_page.dart';
import 'package:furnika/features/products/presentation/pages/search_product_page.dart';
import 'package:furnika/features/profile/presentation/pages/complete_profile_location.dart';
import 'package:furnika/features/profile/presentation/pages/complete_profile_page.dart';
import 'package:furnika/features/profile/presentation/pages/password_management_page.dart';
import 'package:furnika/features/profile/presentation/pages/setting_page.dart';
import 'package:furnika/features/profile/presentation/pages/account_profile_page.dart';
import 'package:furnika/features/profile/presentation/pages/update_profile_page.dart';
import 'package:furnika/features/profile/presentation/pages/user_address_page.dart';
import 'package:furnika/features/review/presentation/pages/create_review_page.dart';
import 'package:furnika/features/wishlist/presentation/pages/wishlist_page.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:furnika/config/routes/route_names.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: checkIsFirstTime(sl<SharedPreferences>())
        ? '/'
        : checkIsLoggedIn()
            ? '/navigationMenu'
            : '/logIn',
    routes: [
      GoRoute(
        name: RouteNames.onBoarding,
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          child: OnboardingPage(),
        ),
      ),
      GoRoute(
        name: RouteNames.signUp,
        path: '/signUp',
        pageBuilder: (context, state) => const MaterialPage(
          child: SignUpPage(),
        ),
      ),
      GoRoute(
        name: RouteNames.login,
        path: '/logIn',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.completeProfile,
        path: '/completeProfile',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CompleteProfilePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.completeProfileLocation,
        path: '/completeProfileLocation',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CompleteProfileLocationPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.updateProfile,
        path: '/updateProfile',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: UpdateProfilePage(
            user: state.extra as User,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.navigationMenu,
        path: '/navigationMenu',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const NavigationMenu(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.home,
        path: '/home',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.filter,
        path: '/filter',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const FilterPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.category,
        path: '/category',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CategoryPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.productByCategory,
        path: '/productByCategory',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: ProductByCategoryPage(
            category: state.extra as Category,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.productDetail,
        path: '/productDetail',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: ProductDetailPage(
            product: state.extra as Product,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.cart,
        path: '/cart',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CartPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.checkout,
        path: '/checkout',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: CheckoutPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.search,
        path: '/search/:text',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: SearchProductPage(
            text: state.pathParameters['text']!,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.chat,
        path: '/chat',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const ChatPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.detailedChat,
        path: '/detailedChat/:name',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: DetailedChatPage(
            name: state.pathParameters['name']!,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.order,
        path: '/order',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const OrderPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.orderDetail,
        path: '/orderDetail',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const OrderDetailPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.review,
        path: '/review',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CreateReviewPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.coupon,
        path: '/coupon',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CouponPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.wishlist,
        path: '/wishlist',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const WishListPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.accountProfile,
        path: '/accountProfile',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const AccountProfilePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.address,
        path: '/address',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const UserAddressPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.setting,
        path: '/setting',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SettingPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.passwordManagement,
        path: '/passwordManagement',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const PasswordManagementPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
    ],
  );
}

SlideTransition buildTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final tween = Tween(begin: const Offset(1, 0), end: Offset.zero).animate(
    CurvedAnimation(parent: animation, curve: Curves.easeInOut),
  );
  return SlideTransition(
    position: tween,
    child: child,
  );
}
