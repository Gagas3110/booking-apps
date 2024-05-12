import 'package:booking_auth/domain/core/extension/booking_auth_extension.dart';
import 'package:booking_auth/presentation/auth/components/signup/signup_form.dart';
import 'package:booking_home/booking_home.dart';
import 'package:flutter/material.dart';

import '../../../../application/login/auth_bloc.dart';
import '../../screen/login/login_screen.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is CreateUserSuccess) {
            context.succesSnackBar('Success Create Account');
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
          }
          if (state is CreateUserError) {
            context.failSnackbar(state.message);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SignupForm(),
        ),
      ),
    );
  }
}
