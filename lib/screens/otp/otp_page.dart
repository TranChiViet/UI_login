import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';

import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/otp_base.dart';
import '../../widgets/text_button_base.dart';
import '../get_password/get_password_page.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: Container(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text('Mã xác thực OTP',
                          style: TxtStyle.txt_robo_24_black_w500),
                    ),
                    Text('Mã xác thực đã được gửi tới số điện thoại 01234xxxx',
                        style: TxtStyle.txt_robo_16_black_w400),
                    const OtpBase(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButtonBase(
                            text: 'Xác thực',
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GetPasswordPage()));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButtonBase(
                            text: 'Gửi lại OTP',
                            onPressed: () {},
                            enableColor: false,
                          ),
                        ),
                        TextButtonBase(
                            text: 'Thay đổi thông tin đăng ký', onPressed: () {}),
                      ],
                    ),
                    const BackTextButtonBase(),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
