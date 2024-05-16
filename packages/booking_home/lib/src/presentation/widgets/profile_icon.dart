import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final String imagePath;
  final double size;
  final Color color;

  const ProfileIcon({
    super.key,
    required this.imagePath,
    this.size = 24.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
