import 'package:first_project/constant/constant_export.dart';

import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/text_field_base.dart';
import '../otp/otp_page.dart';
import 'bloc/forgot_password_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _phoneController = TextEditingController();
  String _phoneErrorText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
          if (state is InvalidPhoneState) {
            setState(() {
              _phoneErrorText = state.content;
            });
          }
          if (state is ValidPhoneState) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const OtpPage()));
          }
        },
        builder: (context, state) {
          return Container(
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
                  Column(
                    children: [
                      TextFieldBase(
                        onChanged: (value) {
                          setState(() {
                            _phoneErrorText = '';
                          });
                        },
                        controller: _phoneController,
                        errorText: _phoneErrorText,
                        label: 'Số điện thoại',
                        hintText: 'Nhập số điện thoại',
                        keyboardType: TextInputType.number,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButtonBase(
                          text: 'Gửi mã OTP',
                          onPressed: () {
                            BlocProvider.of<ForgotPasswordBloc>(context)
                                .add(ForgotPasswordEvent(
                              _phoneController.text,
                            ));
                            
                          },
                        ),
                      ),
                    ],
                  ),
                  const BackTextButtonBase(),
                ],
              ),
            ]),
          );
        },
      ),
    );
  }
}
