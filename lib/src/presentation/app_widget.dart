import 'package:booking_apps/src/presentation/config/themes/app_themes.dart';
import 'package:booking_apps/src/presentation/core/utils/constant.dart';
import 'package:flutter/material.dart';

import 'config/routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: materialAppTitle,
      theme: AppThemes.bookingThene,
      initialRoute: '/',
      onGenerateRoute: (settings) => AppRoutes.routeGenerator(settings),
    );
  }
}
