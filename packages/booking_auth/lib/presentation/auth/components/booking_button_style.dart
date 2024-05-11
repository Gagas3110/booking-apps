import 'package:flutter/material.dart';

class BookingButtonStyle {
  final bool showOutline;
  final bool fill;
  final Color? color;
  final Color borderColor;
  final Color? textColor;
  final Color disableBorderColor;
  final Color disableColor;
  final Color? disableTextColor;
  final double? textSize;

  BookingButtonStyle({
    this.fill = true,
    this.color,
    Color? borderColor,
    this.textColor,
    Color? disableColor,
    this.disableTextColor,
    this.textSize,
    Color? disableBorderColor,
    this.showOutline = true,
  })  : disableBorderColor = disableBorderColor ?? Colors.grey.shade300,
        disableColor = disableColor ?? Colors.grey.shade300,
        borderColor = Colors.green;
}

class PrimaryBookingButtonStyle {
  static BookingButtonStyle style = BookingButtonStyle(
    color: Colors.green,
    fill: true,
    textColor: Colors.white,
    borderColor: Colors.green,
    disableBorderColor: Colors.grey.shade300,
    disableColor: Colors.grey.shade300,
    disableTextColor: Colors.grey,
  );
}
