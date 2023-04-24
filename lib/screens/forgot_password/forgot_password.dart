import 'package:first_project/constant/constant_export.dart';

import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/text_field_base.dart';
import '../otp/otp_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: ImageLogo(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Quên mật khẩu',
                    style: TxtStyle.txt_robo_24_black_w500),
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: 'Vui lòng nhập',
                    style: TxtStyle.txt_robo_16_black_w400,
                  ),
                  TextSpan(
                    text: ' Số điện thoại ',
                    style: TxtStyle.txt_robo_16_black_w600,
                  ),
                  TextSpan(
                    text: 'của bạn',
                    style: TxtStyle.txt_robo_16_black_w400,
                  ),
                ]),
              ),
              Form(
                key: _formKey,
                child: Column(
                      children: [
                        
                        TextFieldBase(
                          label: 'Số điện thoại',
                          hintText: 'Nhập số điện thoại',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            // if (value == null || value.length < 8) {
                            //   return context
                            //       .read<ForgotPasswordCubit>()
                            //       .switchUnCorrectPhone();
                            // } else {
                            //   context
                            //       .read<ForgotPasswordCubit>()
                            //       .switchCorrectPhone();
                            // }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButtonBase(
                            text: 'Gửi mã OTP',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                
                                 Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const OtpPage()));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
              ),
              const BackTextButtonBase(),
            ],
          ),
        ]),
      ),
    );
  }
}
