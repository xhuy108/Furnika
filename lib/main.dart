import 'package:flutter/material.dart';

import 'package:furnika/config/routes/router.dart';
import 'package:furnika/config/themes/theme.dart';
import 'package:furnika/core/utils/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      routerConfig: AppRouter().router, //router
      
    );
  }
}

// ThemeData(
//         scaffoldBackgroundColor: AppPalette.background,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         useMaterial3: true,
//         appBarTheme: const AppBarTheme(
//           color: Colors.transparent,
//         ),
//       )
