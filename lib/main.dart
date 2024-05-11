import 'package:booking_apps/run_booking_app.dart';
import 'package:booking_apps/src/presentation/app_widget.dart';
import 'package:booking_home/booking_home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureBookingHomeDepedencies();
  runBookingApp(
    home: const AppWidget(),
  );
}
