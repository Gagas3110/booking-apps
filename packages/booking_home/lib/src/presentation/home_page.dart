import 'package:booking_home/src/presentation/views/category_view.dart';
import 'package:flutter/material.dart';

import 'views/banner_view.dart';
import 'views/flash_sale_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/image/booking_logo.png',
              width: 30,
            ),
            const SizedBox(width: 10),
            const Text(
              'E-stores',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: const [
          BannerView(),
          CategoryView(),
          FlashSaleView(),
        ],
      ),
    );
  }
}
