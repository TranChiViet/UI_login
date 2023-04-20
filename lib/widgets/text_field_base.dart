import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/widgets/otp_base.dart';
import 'package:flutter/material.dart';

class TextFieldBase extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? correct;
  // final bool? phoneType;
  final Widget? suffix;
  final TextEditingController? controller;
  const TextFieldBase({
    super.key,
    required this.label,
    this.controller,
    this.onChanged,
    this.validator,
    required this.hintText,
    this.suffix,
    this.obscureText = false,
    this.correct = true,
    // this.phoneType = false,
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
                  style: TextStyleApp.txt_robo_16_black_w500,
                ),
                TextSpan(
                  text: ' *',
                  style: TextStyleApp.txt_robo_16_red_w400,
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
              validator: validator,
              cursorColor: ColorApp.colorTitleBlue,
              style: TextStyleApp.txt_robo_16_blue_w400,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyleApp.txt_robo_16_grey_w400,
                  suffixIcon: suffix,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  focusedBorder: _borderFocus(correct!),
                  enabledBorder: _borderEnable(correct!),
                  border: _borderEnable(correct!)),
              // keyboardType: TextInputType.number,
            ),
          )
        ],
      ),
    );
  }

  InputBorder _borderFocus(bool correct) {
    return OutlineInputBorder(
        borderSide: BorderSide(
            color: correct ? ColorApp.colorTitleBlue : ColorApp.colorTitleRed,
            width: 2),
        borderRadius: BorderRadius.circular(16));
  }

  InputBorder _borderEnable(bool correct) {
    return OutlineInputBorder(
        borderSide: BorderSide(
            color: correct
                ? ColorApp.colorTitleBlack.withOpacity(0.1)
                : ColorApp.colorTitleRed,
            width: 1),
        borderRadius: BorderRadius.circular(16));
  }
}
