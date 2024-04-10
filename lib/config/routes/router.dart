import 'package:flutter/material.dart';
import 'package:furnika/features/auth/presentation/pages/log_in_page.dart';
import 'package:furnika/features/auth/presentation/pages/sign_up_page.dart';
import 'package:furnika/features/home/presentation/pages/home_page.dart';
import 'package:furnika/features/onboarding/presentation/pages/onboarding.dart';
import 'package:furnika/features/profile/presentation/pages/complete_profile_location.dart';
import 'package:furnika/features/profile/presentation/pages/complete_profile_page.dart';
import 'package:furnika/features/profile/settings.dart';
import 'package:furnika/features/profile/yourprofile.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:furnika/config/routes/route_names.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/completeProfileLocation',
    // sl<SharedPreferences>().getBool(kFirstTimer) == null
    //     ? '/'
    //     : ((sl<SharedPreferences>().getString(kAuthToken) == null ||
    //             sl<SharedPreferences>().getString(kAuthToken) == '')
    //         ? '/logIn'
    //         : '/application'),
    routes: [
      GoRoute(
        name: RouteNames.onBoarding,
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          child: MyHomePage(),
        ),
      ),
      GoRoute(
        name: RouteNames.signUp,
        path: '/signUp',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SignUpPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
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
      // GoRoute(
      //   name: RouteNames.category,
      //   path: '/category',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     child: const CategoriesScreen(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return buildTransition(
      //           context, animation, secondaryAnimation, child);
      //     },
      //   ),
      // ),
      // GoRoute(
      //   name: RouteNames.productByCategory,
      //   path: '/productByCategory/:category/:categoryId',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     child: DetailCategoryScreen(
      //       category: state.pathParameters['category']!,
      //       categoryId: state.pathParameters['categoryId']!,
      //     ),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return buildTransition(
      //           context, animation, secondaryAnimation, child);
      //     },
      //   ),
      // ),
      // GoRoute(
      //   name: RouteNames.productDetail,
      //   path: '/productDetail',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     child: ProductDetailScreen(
      //       product: state.extra as Product,
      //     ),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return buildTransition(
      //           context, animation, secondaryAnimation, child);
      //     },
      //   ),
      // ),
      // GoRoute(
      //   name: RouteNames.cart,
      //   path: '/cart',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     child: const MyCartScreen(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return buildTransition(
      //           context, animation, secondaryAnimation, child);
      //     },
      //   ),
      // ),
      // GoRoute(
      //   name: RouteNames.checkout,
      //   path: '/checkout/:cart',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     child: CheckoutScreen(
      //       cart: state.pathParameters['cart']!,
      //     ),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return buildTransition(
      //           context, animation, secondaryAnimation, child);
      //     },
      //   ),
      // ),
      // GoRoute(
      //   name: RouteNames.search,
      //   path: '/search/:text',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     child: SearchScreen(
      //       text: state.pathParameters['text']!,
      //     ),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return buildTransition(
      //           context, animation, secondaryAnimation, child);
      //     },
      //   ),
      // ),
      // GoRoute(
      //   name: RouteNames.wishlist,
      //   path: '/wishlist',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     child: const WishlistScreen(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return buildTransition(
      //           context, animation, secondaryAnimation, child);
      //     },
      //   ),
      // ),
      // GoRoute(
      //   name: RouteNames.application,
      //   path: '/application',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     child: const ApplicationScreen(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return buildTransition(
      //           context, animation, secondaryAnimation, child);
      //     },
      //   ),
      // ),
      // GoRoute(
      //   name: RouteNames.settings,
      //   path: '/settings',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     child: const SettingProfile(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return buildTransition(
      //           context, animation, secondaryAnimation, child);
      //     },
      //   ),
      // ),
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
