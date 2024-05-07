import 'package:flutter/material.dart';
import 'package:peludos_pet/app/view/global_controller/theme_controller.dart';
import 'package:peludos_pet/app/view/pages/login/login_page.dart';
import 'package:peludos_pet/app/view/routes/app_routes.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';
import 'package:flutter_meedu/ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final theme = ref.watch(themeProvider);
      return MaterialApp(
        title: 'Peludos Pet',
        navigatorKey: router.navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.WELCOME,
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        themeMode: theme.mode,
        navigatorObservers: [
          router.observer,
        ],
        routes: appRoutes,
        onGenerateRoute: (setting) {
          return MaterialPageRoute(
            builder: (context) => const Login(),
          );
        },
      );
    });
  }
}
