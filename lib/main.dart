import 'package:booking_apps/firebase_options.dart';
import 'package:booking_apps/src/presentation/app_widget.dart';
import 'package:booking_auth/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureBookingAuthDepedencies();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    runApp(const AppWidget());
  } catch (e) {
    print('Firebase initialization failed : $e');
  }
}
