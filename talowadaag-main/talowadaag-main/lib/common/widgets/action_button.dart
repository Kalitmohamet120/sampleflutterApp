import 'package:flutter/material.dart';
import 'package:talowadaag/common/widgets/base_button.dart';

class ActionButton extends BaseButton {
  final double width;
  final double height;
  final Color? backgroundColor;

  const ActionButton(
      {super.key,
        required super.widget,
        required super.onTap,
        this.width = 0.98,
        this.height = 50,
        this.backgroundColor = Colors.red});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
          alignment: Alignment.center,
          // padding: const EdgeInsets.symmetric(vertical: 12),
          width: MediaQuery.of(context).size.width * width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: widget),
    );
  }
}