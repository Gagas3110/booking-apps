import 'package:flutter/material.dart';

class ResponsiveSizeBox extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final AlignmentGeometry alignment;

  const ResponsiveSizeBox({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.alignment = Alignment.topCenter,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    const idealAspectRatio = 9 / 16;
    final space = width - height * idealAspectRatio;
    const spaceRatio = 1;

    const accuracy = 0.95;
    final currentAspectRatio = (width / height) * accuracy;
    final isTablet = currentAspectRatio > idealAspectRatio;

    return isTablet
        ? Align(
            alignment: alignment,
            child: SizedBox(
              width: this.width ?? (width - space * spaceRatio),
              height: this.height,
              child: child,
            ),
          )
        : child;
  }
}