import 'package:flutter/material.dart';

import '../../domain/models/product_mdl.dart';

class ProductCard extends StatelessWidget {
  final ProductMdl product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          product.company,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        const Text(
          'Rp. 100.000', //TODO
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
