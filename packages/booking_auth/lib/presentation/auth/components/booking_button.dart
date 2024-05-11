import 'dart:async';

import 'package:booking_auth/presentation/auth/components/booking_button_style.dart';
import 'package:flutter/material.dart';

class BookingButton extends StatelessWidget {
  final BookingButtonStyle style;
  final String title;
  final FutureOr<void> Function() onPressed;
  final bool parseWidth;
  final bool isDisabled;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final MainAxisAlignment? mainAxisAlignment;

  const BookingButton({
    super.key,
    required this.style,
    required this.onPressed,
    required this.title,
    this.parseWidth = true,
    this.isDisabled = false,
    this.leftIcon,
    this.rightIcon,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    double width;
    if (title == '') {
      width = 48;
    } else {
      width = ((title.length) * 13.toDouble());
    }
    return InkWell(
      onTap: () async {
        if (!isDisabled) {
          await onPressed();
        }
      },
      child: Container(
        height: 48,
        width: parseWidth ? double.infinity : width,
        decoration: BoxDecoration(
          border: style.showOutline
              ? Border.all(
                  color:
                      isDisabled ? style.disableBorderColor : style.borderColor,
                )
              : null,
          color: style.fill
              ? isDisabled
                  ? style.disableColor
                  : style.color
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment:
                mainAxisAlignment ?? MainAxisAlignment.spaceAround,
            children: [
              if (leftIcon != null) leftIcon!,
              if (title != '')
                Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6),
                      child: Center(
                        child: Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: isDisabled
                                      ? Colors.grey
                                      : style.textColor,
                                  fontSize: style.textSize ?? 14),
                        ),
                      ),
                    ),
                  ),
                ),
              if (rightIcon != null) rightIcon!
            ],
          ),
        ),
      ),
    );
  }
}
