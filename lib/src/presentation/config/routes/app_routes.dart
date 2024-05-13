import 'package:booking_apps/src/presentation/core/utils/constant.dart';
import 'package:booking_apps/src/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return _materialRoute(const SplashScreen(), settings);
      default:
        return _materialRoute(
            Scaffold(
              appBar: AppBar(
                title: const Text('Cant find Page'),
              ),
              body: const Center(child: Text('Error')),
            ),
            settings);
    }
  }

  static MaterialPageRoute _materialRoute(
      Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }
}
