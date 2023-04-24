import 'package:first_project/constant/constant_export.dart';

import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';


import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/text_field_base.dart';

class GetPasswordPage extends StatefulWidget {
  const GetPasswordPage({super.key});

  @override
  State<GetPasswordPage> createState() => _GetPasswordPageState();
}

class _GetPasswordPageState extends State<GetPasswordPage> {
  bool _obscureNewPassword = true;
  bool _obscurePassword = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
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
                const Text('Vui lòng nhập mật khẩu mới của bạn.',
                    style: TxtStyle.txt_robo_16_black_w400),
                TextFieldBase(
                  obscureText: _obscureNewPassword,
                  label: 'Mật khẩu mới',
                  hintText: 'Mật khẩu chứa ít nhất 8 kí tự',
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureNewPassword = !_obscureNewPassword;
                      });
                    },
                    child: Image.asset(_obscureNewPassword
                        ? 'assets/icons/hidden.png'
                        : 'assets/icons/unhide.png'),
                  ),
                ),
                TextFieldBase(
                  obscureText: _obscurePassword,
                  label: 'Xác nhận mật khẩu',
                  hintText: 'Nhập lại mật khẩu mới',
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                      
                    },
                    child: Image.asset(_obscurePassword
                        ? 'assets/icons/hidden.png'
                        : 'assets/icons/unhide.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButtonBase(
                    text: 'Lưu',
                    onPressed: () {},
                  ),
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
