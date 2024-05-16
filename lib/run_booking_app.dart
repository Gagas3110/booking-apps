// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:booking_apps/firebase_options.dart';
import 'package:booking_auth/injection.dart';
import 'package:booking_home/booking_home.dart';
import 'package:booking_product_list/booking_product_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> runBookingApp({
  required Widget home,
}) async {
  configureBookingAuthDepedencies();
  configureBookingHomeDepedencies();
  configureBookingProductListDepedencies();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    // Set up Crashlytics
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // Set up error handler
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    //PlatformError
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    runApp(home);
  } catch (e) {
    print('Firebase initialization failed : $e');
  }
}
