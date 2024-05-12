import 'package:booking_auth/domain/auth/firebase_auth_request.dart';
import 'package:booking_auth/presentation/auth/components/booking_button.dart';
import 'package:booking_auth/presentation/auth/components/booking_button_style.dart';
import 'package:booking_auth/presentation/auth/components/booking_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/login/auth_bloc.dart';
import '../../../../domain/core/utils/auth_constant.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Welcome\nto BookingApps',
                  style: TextStyle(fontSize: 30),
                ),
                Image.asset('assets/image/booking_logo.png',
                    width: 40, height: 40),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Easy Books for all people',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 100),
          BookingFormTextField(
              hint: 'Email',
              controller: _usernameController,
              maxLength: 30,
              inputType: TextInputType.emailAddress,
              validator: (value) {
                RegExp regExp = RegExp(regExpString);
                if (!regExp.hasMatch(value!)) {
                  return 'Please enter your email';
                } else if (value.isEmpty) {
                  return "Please enter username";
                }
                return null;
              }),
          const SizedBox(height: 20),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final bool isObscured =
                  state is GetObsecureBool ? state.obs : true;
              return BookingFormTextField(
                hint: 'Password',
                controller: _passwordController,
                maxLength: 30,
                obsecure: isObscured,
                inputType: TextInputType.emailAddress,
                validator: (value) =>
                    value!.isEmpty ? "Please enter password" : null,
                suffixIcon: GestureDetector(
                  onTap: () =>
                      context.read<AuthBloc>().add(CheckObs(isObscured)),
                  child: Icon(
                    isObscured ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 40),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final bool isLoading = state is LoginProgress;
              return BookingButton(
                isDisabled: isLoading,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final body = FirebaseAuthRequest(
                      email: _usernameController.text,
                      password: _passwordController.text,
                      //expiresInMins: 30,
                    );
                    context.read<AuthBloc>().add(LoginSubmittedF(body));
                  }
                },
                title: 'Login',
                style: PrimaryBookingButtonStyle.style,
                isVisibleLoad: isLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
