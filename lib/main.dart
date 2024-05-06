import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:furnika/config/routes/router.dart';
import 'package:furnika/config/themes/theme.dart';
import 'package:furnika/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:furnika/core/common/cubits/navigation/navigation_cubit.dart';
import 'package:furnika/core/utils/injection_container.dart';
import 'package:furnika/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:furnika/features/categories/presentation/all_categories_bloc/all_categories_bloc.dart';
import 'package:furnika/features/categories/presentation/category_bloc/category_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => sl<NavigationCubit>(),
      ),
      BlocProvider(
        create: (_) => sl<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => sl<AuthBloc>(),
      ),
      BlocProvider(
        create: (_) => sl<CategoryBloc>(),
      ),
      BlocProvider(
        create: (_) => sl<AllCategoriesBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => child!,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeMode,
        routerConfig: AppRouter().router, //router
      ),
    );
  }
}
