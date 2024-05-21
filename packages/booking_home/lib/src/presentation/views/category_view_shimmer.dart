import 'package:booking_home/booking_home.dart';
import 'package:flutter/material.dart';

class CategoryViewShimmer extends StatelessWidget {
  const CategoryViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                width: 100,
                color: Colors.grey,
              ),
              Container(
                height: 20,
                width: 100,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 18),
          categoriesGridviewWidget(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  GridView categoriesGridviewWidget() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 4 / 1,
      children: List.generate(
        4,
        (index) => Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
