import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/text_field_base.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;
  bool _obscureRePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: [
            const ImageLogo(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('Tạo tài khoản',
                      style: TxtStyle.txt_robo_24_black_w500),
                ),
                const TextFieldBase(
                  label: 'Họ tên',
                  hintText: 'Nhập tên của bạn',
                ),
                const TextFieldBase(
                  label: 'Số điện thoại',
                  hintText: 'Nhập số điện thoại',
                ),
                TextFieldBase(
                  obscureText: _obscurePassword,
                  label: 'Mật khẩu',
                  hintText: 'Mật khẩu chứa ít nhất 8 kí tự',
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
                TextFieldBase(
                  obscureText: _obscureRePassword,
                  label: 'Nhập lại mật khẩu',
                  hintText: 'Mật khẩu chứa ít nhất 8 kí tự',
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureRePassword = !_obscureRePassword;
                      });
                    },
                    child: Image.asset(_obscureRePassword
                        ? 'assets/icons/hidden.png'
                        : 'assets/icons/unhide.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButtonBase(
                    text: 'Đăng nhập',
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
