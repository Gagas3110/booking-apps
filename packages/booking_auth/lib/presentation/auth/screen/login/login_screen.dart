// // ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:booking_home/booking_home.dart';

import '../../../../application/login/auth_bloc.dart';
import '../../../../injection.dart';
import '../../components/login/login_body.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: const LoginBody(),
    );
  }
}

