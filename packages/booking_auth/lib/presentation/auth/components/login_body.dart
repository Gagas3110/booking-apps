import 'package:booking_auth/domain/core/extension/booking_auth_extension.dart';
import 'package:booking_auth/presentation/auth/components/login_form.dart';
import 'package:booking_home/booking_home.dart';
import 'package:flutter/material.dart';

import '../../../application/login/login_bloc.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
          }
          if (state is LoginFailed) {
            context.failSnackbar(state.failure!.e.toString());
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
