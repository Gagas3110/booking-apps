import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingFormTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final String? hint, label;
  final String? Function(String?)? validator, onChanged, onAction;
  final List<TextInputFormatter>? formatter;
  final Function()? onTap;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? readOnly, enabled;
  final int? maxLine, maxLength;
  final bool? obsecure;

  const BookingFormTextField(
      {super.key,
      this.suffixIcon,
      this.hint,
      this.label,
      this.validator,
      this.onChanged,
      this.onAction,
      this.inputType,
      this.inputAction,
      this.focusNode,
      this.readOnly,
      this.onTap,
      this.controller,
      this.enabled,
      this.maxLine = 1,
      this.maxLength,
      this.obsecure = false,
      this.formatter});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: inputType != TextInputType.number,
      inputFormatters: formatter,
      autofocus: true,
      readOnly: readOnly ?? false,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      focusNode: focusNode,
      keyboardType: inputType,
      maxLines: maxLine,
      obscureText: obsecure ?? false,
      textInputAction: inputAction,
      onFieldSubmitted: onAction,
      onTap: onTap,
      style: const TextStyle(color: Colors.black, fontSize: 12),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabled: enabled ?? true,
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
        labelStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
        filled: true,
        fillColor: (readOnly == null)
            ? Colors.grey.shade300
            : readOnly!
                ? Colors.grey.shade300
                : Colors.grey.shade300,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((4)),
            borderSide: BorderSide(color: Colors.grey.shade300)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((4)),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 0.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((4)),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((4)),
            borderSide: const BorderSide(color: Colors.red, width: 0.5)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((4)),
            borderSide: const BorderSide(color: Colors.red, width: 0.5)),
      ),
    );
  }
}
