import 'package:booking_auth/presentation/auth/components/booking_button.dart';
import 'package:booking_auth/presentation/auth/components/booking_button_style.dart';
import 'package:booking_auth/presentation/auth/components/booking_textfield.dart';
import 'package:flutter/material.dart';
import 'package:booking_home/booking_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Form(
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
              const BookingFormTextField(
                hint: 'Username',
              ),
              const SizedBox(height: 20),
              const BookingFormTextField(
                hint: 'Password',
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              BookingButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                },
                title: 'Login',
                style: PrimaryBookingButtonStyle.style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
