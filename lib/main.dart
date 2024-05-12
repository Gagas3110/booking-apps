import 'package:booking_apps/run_booking_app.dart';
import 'package:booking_apps/src/presentation/app_widget.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runBookingApp(
    home: const AppWidget(),
  );
}
