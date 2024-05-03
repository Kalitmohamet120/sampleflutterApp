import 'package:flutter/cupertino.dart';

class BaseButton extends StatelessWidget {
  final Widget widget;
  final Function onTap;

  const BaseButton({super.key, required this.widget, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}