import 'dart:async';

import 'package:booking_auth/presentation/auth/components/booking_button.dart';
import 'package:booking_auth/presentation/auth/components/booking_button_style.dart';
import 'package:booking_auth/presentation/auth/components/responsive_sizedbox.dart';
import 'package:booking_auth/presentation/auth/screen/signup/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePackageScreen extends StatefulWidget {
  const WelcomePackageScreen({super.key});

  @override
  State<WelcomePackageScreen> createState() => _WelcomePackageScreenState();
}

class _WelcomePackageScreenState extends State<WelcomePackageScreen> {
  final bool isNavigated = false;
  int selection = 0;
  Timer? timer;
  final PageController pageC = PageController(initialPage: 0);
  static final List<Map> _listData = [
    {
      "title": "Belanja Puas",
      "subtitle": "Barang beragam dengan harga murah",
      "image": Image.asset(
        'assets/image/booking_logo.png',
        fit: BoxFit.scaleDown,
        width: double.infinity,
      ),
    },
    {
      "title": "Bisa Cicilan",
      "subtitle": "Miliki barang yang anda inginkan dengan cicilan hingga 0%",
      "image": Image.asset(
        'assets/image/booking_logo.png',
        fit: BoxFit.scaleDown,
        width: double.infinity,
      ),
    },
    {
      "title": "Gratis Ongkir",
      "subtitle": "Gratis Ongkir ke seluruh Indonesia",
      "image": Image.asset(
        'assets/image/booking_logo.png',
        fit: BoxFit.scaleDown,
        width: double.infinity,
      ),
    }
  ];

  @override
  void initState() {
    setState(() {
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        if (isNavigated) {
          timer.cancel();
        } else {
          if (selection < _listData.length - 1) {
            selection++;
          } else {
            selection = 0;
          }
          if (pageC.hasClients) {
            pageC.animateToPage(selection,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          }
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageC.dispose();
    timer?.cancel();
    super.dispose();
  }

  void onPageChanged(int selections) {
    setState(() {
      selection = selections;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: pageC,
              onPageChanged: (int selection) => onPageChanged(selection),
              itemCount: _listData.length,
              itemBuilder: (context, index) {
                final image = _listData[index]["image"];
                return Container(
                  margin:
                      const EdgeInsets.only(left: 14, right: 14, bottom: 14),
                  child: image,
                );
              },
            ),
          ),
          ResponsiveSizeBox(
            child: Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      _listData[selection]["title"],
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      _listData[selection]["subtitle"],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 12,
                      bottom: 12,
                    ),
                    child: Row(
                      children: <Widget>[
                        const Spacer(),
                        for (var i = 0; i < _listData.length; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.5),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: i == selection
                                  ? Icon(
                                      CupertinoIcons.circle_fill,
                                      size: 12,
                                      color: Colors.green.withOpacity(0.8),
                                    )
                                  : Icon(
                                      CupertinoIcons.circle_fill,
                                      size: 12,
                                      color: Colors.grey.withOpacity(0.1),
                                    ),
                            ),
                          ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  BookingButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                    },
                    title: 'Lanjutkan',
                    style: PrimaryBookingButtonStyle.style,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
