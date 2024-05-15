import 'package:booking_home/booking_home.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  final List<Product> productList;
  final bool isLoading;

  const ProductGridView({
    super.key,
    required this.productList,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(18.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 12,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.5,
          ),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: productList[index],
            );
          },
        ),
        if (isLoading) ...[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: CircularProgressIndicator(),
          ),
        ],
      ],
    );
  }
}
