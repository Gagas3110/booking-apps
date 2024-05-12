// ignore_for_file: avoid_print

import 'package:booking_auth/domain/core/extension/booking_auth_extension.dart';
import 'package:booking_auth/presentation/auth/components/login/login_form.dart';
import 'package:booking_home/booking_home.dart';
import 'package:flutter/material.dart';

import '../../../../application/login/auth_bloc.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessF) {
            context.succesSnackBar('Login Success');
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
          }

          if (state is LoginFailed) {
            print(state.failure.toString());
            context.failSnackbar(state.failure.toString());
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: LoginForm(),
        ),
      ),
    );
  }
}
