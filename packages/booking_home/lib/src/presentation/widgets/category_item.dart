import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;

  const CategoryItem({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
