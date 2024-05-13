import 'package:flutter/material.dart';

successSnackBar(String message, BuildContext context) {
  return SnackBar(
    duration: const Duration(seconds: 5),
    behavior: SnackBarBehavior.floating,
    content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Colors.green,
  );
}

failSnackBar(String message, BuildContext ctx) {
  return SnackBar(
    duration: const Duration(seconds: 5),
    behavior: SnackBarBehavior.floating,
    content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Colors.red,
  );
}
