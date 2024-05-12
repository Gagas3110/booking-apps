import 'package:booking_auth/domain/auth/firebase_auth_request.dart';
import 'package:booking_auth/presentation/auth/components/booking_button.dart';
import 'package:booking_auth/presentation/auth/components/booking_button_style.dart';
import 'package:booking_auth/presentation/auth/components/booking_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/login/auth_bloc.dart';
import '../../screen/login/login_screen.dart';

class SignupForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/image/booking_logo.png',
                    width: 40, height: 40),
                const SizedBox(height: 10),
                const Text(
                  'Sign Up Form',
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Hola New User',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 60),
          BookingFormTextField(
              hint: 'Name',
              controller: _nameController,
              maxLength: 30,
              inputType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your Name";
                }
                return null;
              }),
          const SizedBox(height: 20),
          BookingFormTextField(
              hint: 'Email',
              controller: _usernameController,
              maxLength: 30,
              inputType: TextInputType.emailAddress,
              validator: (value) {
                String regExpString =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
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
              final bool isLoading = state is CreateUserLoading;
              return BookingButton(
                isDisabled: isLoading,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final body = FirebaseAuthRequest(
                      email: _usernameController.text,
                      password: _passwordController.text,
                      //expiresInMins: 30,
                    );
                    context.read<AuthBloc>().add(CreateAccountFirebase(body));
                  }
                },
                title: 'Submit',
                style: PrimaryBookingButtonStyle.style,
                isVisibleLoad: isLoading,
              );
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text(
                'Already have account ?',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                child: Text(
                  'Login Now',
                  style: TextStyle(color: Colors.green.shade700, fontSize: 16),
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
