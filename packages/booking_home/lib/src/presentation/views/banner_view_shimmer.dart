import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerViewShimmer extends StatelessWidget {
  const BannerViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade300,
      child: GridView.count(
        shrinkWrap: true,
        mainAxisSpacing: 1,
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        children: List.generate(
          2,
          (index) => Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
