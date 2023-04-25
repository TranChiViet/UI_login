import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/widgets/otp_base.dart';
import 'package:flutter/material.dart';

class TextFieldBase extends StatelessWidget {
  final String label;
  final String hintText;
  final String errorText;
  final ValueChanged<String>? onChanged;
  final bool? obscureText;
  final bool enable;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final TextEditingController? controller;
  const TextFieldBase({
    super.key,
    required this.label,
    this.controller,
    this.onChanged,
    required this.hintText,
    this.suffix,
    this.obscureText = false,
    this.enable = true,
    this.keyboardType,
    this.errorText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: label,
                  style: TxtStyle.txt_robo_16_black_w500,
                ),
                TextSpan(
                  text: ' *',
                  style: TxtStyle.txt_robo_16_red_w400,
                ),
              ]),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorApp.colorWhite,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1,
                      color: ColorApp.colorTitleBlack.withOpacity(0.15),
                      offset: Offset(2, 4)),
                  BoxShadow(
                      blurRadius: 1,
                      color: ColorApp.colorTitleBlack.withOpacity(0.1),
                      offset: Offset(-2, 0))
                ]),
            child: TextFormField(
              controller: controller,
              obscureText: obscureText!,
              onChanged: onChanged,
              keyboardType: keyboardType,
              cursorColor: ColorApp.colorTitleBlue,
              style: TxtStyle.txt_robo_16_blue_w400,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TxtStyle.txt_robo_16_grey_w400,
                  suffixIcon: suffix,
                  enabled: enable,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  focusedBorder: _borderFocus(errorText),
                  enabledBorder: _borderEnable(errorText),
                  border: _borderEnable(errorText)),
              // keyboardType: TextInputType.number,
            ),
          ),
          if (errorText != '')
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(errorText,
                  style: enable ? TxtStyle.txt_robo_16_red_w400 : TxtStyle.txt_robo_16_grey_w400),
            )
        ],
      ),
    );
  }

  InputBorder _borderFocus(String errorText) {
    return OutlineInputBorder(
        borderSide: BorderSide(
            color: errorText == '' ? ColorApp.colorTitleBlue : ColorApp.colorTitleRed,
            width: 2),
        borderRadius: BorderRadius.circular(16));
  }

  InputBorder _borderEnable(String errorText) {
    return OutlineInputBorder(
        borderSide: BorderSide(
            color: errorText == ''
                ? ColorApp.colorTitleBlack.withOpacity(0.1)
                : ColorApp.colorTitleRed,
            width: 1),
        borderRadius: BorderRadius.circular(16));
  }
}
