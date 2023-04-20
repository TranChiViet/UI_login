import 'package:first_project/constant/constant_export.dart';
import 'package:flutter/material.dart';

class TextButtonBase extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool? enableColor;

  const TextButtonBase(
      {super.key,
      required this.text,
      required this.onPressed,
      this.enableColor = true});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: enableColor == true
            ? TextStyleApp.txt_robo_16_blue_w400
            : TextStyleApp.btn_robo_16_grey_w400,
      ),
    );
  }
}
