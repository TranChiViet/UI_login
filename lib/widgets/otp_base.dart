import 'package:first_project/constant/constant_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpBase extends StatelessWidget {
  const OtpBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildSizeBox(context, 'pin1'),
          buildSizeBox(context, 'pin2'),
          buildSizeBox(context, 'pin3'),
          buildSizeBox(context, 'pin4'),
        ],
      ),
    ),
  );
  }
}

Widget buildSizeBox(BuildContext ctx, String pin) {
  return Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
        color: ColorApp.colorWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              blurRadius: 1,
              color: ColorApp.colorTitleBlack.withOpacity(0.15),
              offset: const Offset(2, 4)),
          BoxShadow(
              blurRadius: 1,
              color: ColorApp.colorTitleBlack.withOpacity(0.1),
              offset: const Offset(-2, 0))
        ]),
    child: TextFormField(
      onSaved: (pin) {},
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(ctx).nextFocus();
        }
      },
      decoration: InputDecoration(
        hintStyle: TextStyleApp.txt_robo_16_grey_w400,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        focusedBorder: _borderFocus(),
        enabledBorder: _borderEnable(),
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
    ),
  );
}

InputBorder _borderFocus() {
  return OutlineInputBorder(
      borderSide: BorderSide(color: ColorApp.colorTitleBlue, width: 2),
      borderRadius: BorderRadius.circular(16));
}

InputBorder _borderEnable() {
  return OutlineInputBorder(
      borderSide: BorderSide(color: ColorApp.colorTitleBlack.withOpacity(0.1)),
      borderRadius: BorderRadius.circular(16));
}
