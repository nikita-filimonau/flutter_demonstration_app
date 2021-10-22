import 'package:flutter/material.dart';
import 'package:demonstration_project/constants/colors.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final Color? color;

  ElevatedButtonCustom({
    required this.onPressed,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: color ?? kColorPrimary,
          minimumSize: Size(100.0, 45.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          )),
    );
  }
}
