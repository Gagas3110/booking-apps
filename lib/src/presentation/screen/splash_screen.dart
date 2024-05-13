import 'package:booking_apps/src/presentation/screen/welcome_package_screen.dart';
import 'package:booking_auth/application/login/auth_bloc.dart';
import 'package:booking_auth/injection.dart';
import 'package:booking_home/booking_home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>()..add(const CheckLoginF()),
      child: const SplashBody(),
    );
  }
}

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const assetImage = "assets/image/booking_logo.png";
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is IsLoginState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage()));
        }
        if (state is NotLoginState) {
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const WelcomePackageScreen()));
            },
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(assetImage),
        ),
      ),
    );
  }
}
