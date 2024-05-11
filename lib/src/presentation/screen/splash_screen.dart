import 'package:booking_apps/src/presentation/screen/welcome_package_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WelcomePackageScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const assetImage = "assets/image/booking_logo.png";
    return Scaffold(
      body: Center(
        child: Image.asset(assetImage),
      ),
    );
  }
}
