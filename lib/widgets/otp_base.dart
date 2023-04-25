import 'package:first_project/constant/constant_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpBox extends StatelessWidget {
  final TextEditingController? controller;
  VoidCallback? clearError;
  OtpBox({
    super.key,
    this.controller,
    this.clearError,
  });

  @override
  Widget build(BuildContext context) {
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
        controller: controller,
        onSaved: (pin) {},
        onChanged:
            // onChanged,
            (value) {
          clearError!();
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(
          hintStyle: TxtStyle.txt_robo_16_grey_w400,
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
