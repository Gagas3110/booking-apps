import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
