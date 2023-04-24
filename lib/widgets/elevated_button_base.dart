import 'package:first_project/constant/constant_export.dart';
import 'package:flutter/material.dart';

class ElevatedButtonBase extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool? enableColor;

  const ElevatedButtonBase(
      {super.key,
      required this.text,
      required this.onPressed,
      this.enableColor = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
            elevation: enableColor == true ? 2 : 0,
            backgroundColor: enableColor == true
                ? ColorApp.colorButtonBlue
                : ColorApp.colorButtonBlueSecond,
            foregroundColor: enableColor == true
                ? ColorApp.colorButtonBlue
                : ColorApp.colorButtonBlueSecond,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
        child: Text(
          text,
          style: enableColor == true
              ? TxtStyle.txt_robo_16_white_w500
              : TxtStyle.txt_robo_16_blue_w500,
        ),
      ),
    );
  }
}
