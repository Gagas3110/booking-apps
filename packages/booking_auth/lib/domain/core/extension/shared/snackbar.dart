import 'package:flutter/material.dart';

successSnackBar(String message) {
  return SnackBar(
    duration: const Duration(seconds: 5),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Colors.green,
  );
}

failSnackBar(String message) {
  return SnackBar(
    duration: const Duration(seconds: 5),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Colors.red,
  );
}
