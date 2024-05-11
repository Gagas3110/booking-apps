import 'package:flutter/material.dart';

/// This File contains [Theme]
///  That will be used in  [main]

class AppThemes {
  static ThemeData get bookingThene => ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.grey.shade100,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20))),
      ));
}
