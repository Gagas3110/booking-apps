// // ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:booking_home/booking_home.dart';

import '../../../../application/login/auth_bloc.dart';
import '../../../../injection.dart';
import '../../components/signup/signup_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: const SignupBody(),
    );
  }
}
