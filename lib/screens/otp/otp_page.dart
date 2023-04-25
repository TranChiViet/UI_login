import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/otp_base.dart';
import '../../widgets/text_button_base.dart';
import '../get_password/get_password_page.dart';
import 'bloc/otp_bloc.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _pin1Controller = TextEditingController();
  final TextEditingController _pin2Controller = TextEditingController();
  final TextEditingController _pin3Controller = TextEditingController();
  final TextEditingController _pin4Controller = TextEditingController();
  String _errorPin = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: BlocConsumer<OtpBloc, OtpState>(
        listener: (context, state) {
          if (state is InvalidOtpState) {
            _errorPin = state.content;
          }
          if (state is ValidOtpState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const GetPasswordPage()));
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(height: 20,),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: ImageLogo(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text('Mã xác thực OTP',
                              style: TxtStyle.txt_robo_24_black_w500),
                        ),
                        const Text(
                            'Mã xác thực đã được gửi tới số điện thoại 01234xxxx',
                            style: TxtStyle.txt_robo_16_black_w400),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OtpBox(
                                    controller: _pin1Controller,
                                    clearError: () => clearError()),
                                OtpBox(
                                    controller: _pin2Controller,
                                    clearError: () => clearError()),
                                OtpBox(
                                    controller: _pin3Controller,
                                    clearError: () => clearError()),
                                OtpBox(
                                    controller: _pin4Controller,
                                    clearError: () => clearError()),
                              ],
                            ),
                          ),
                        ),
                        if (_errorPin != '')
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(_errorPin,
                                  style: TxtStyle.txt_robo_16_red_w400),
                            ),
                          ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButtonBase(
                                text: 'Xác thực',
                                onPressed: () {
                                   BlocProvider.of<OtpBloc>(context)
                                .add(OtpEvent(
                              _pin1Controller.text,
                              _pin2Controller.text,
                              _pin3Controller.text,
                              _pin4Controller.text,
                            ));
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButtonBase(
                                text: 'Gửi lại OTP',
                                onPressed: () {},
                                enableColor: false,
                              ),
                            ),
                            TextButtonBase(
                                text: 'Thay đổi thông tin đăng ký',
                                onPressed: () {}),
                          ],
                        ),
                        const BackTextButtonBase(),
                      ],
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }

  void clearError() {
    setState(() {
      _errorPin = '';
    });
  }
}
