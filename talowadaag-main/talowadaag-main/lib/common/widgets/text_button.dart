import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/plate.dart';
import 'base_button.dart';

class CustomTextButton extends BaseButton {
  final bool hasOverlay;

  const CustomTextButton(
      {super.key,
      this.hasOverlay = false,
      required super.widget,
      required super.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith(
          (states) => EdgeInsets.zero,
        ),
        foregroundColor:
            MaterialStateProperty.resolveWith((states) => Plate.primaryColor),
        overlayColor: MaterialStateProperty.resolveWith(
            (states) => hasOverlay ? Colors.black12 : Colors.transparent),
        shape: MaterialStateProperty.resolveWith(
          (states) => const CircleBorder(),
        ),
      ),
      child: widget,
    );
  }
}
