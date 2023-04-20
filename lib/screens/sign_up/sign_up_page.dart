import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/text_field_base.dart';
import 'cubit/sign_up_cubit.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          const ImageLogo(),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              bool obscurePassword = state.obscurePassword;
              bool obscureRePassword = state.obscureRePassword;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Tạo tài khoản',
                        style: TextStyleApp.txt_robo_24_black_w500),
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
                    obscureText: !obscurePassword,
                    label: 'Mật khẩu',
                    hintText: 'Mật khẩu chứa ít nhất 8 kí tự',
                    suffix: GestureDetector(
                      onTap: () {
                        context.read<SignUpCubit>().switchPassword();
                      },
                      child: Image.asset(obscurePassword
                          ? 'assets/icons/unhide.png'
                          : 'assets/icons/hidden.png'),
                    ),
                  ),
                  TextFieldBase(
                    obscureText: !obscureRePassword,
                    label: 'Nhập lại mật khẩu',
                    hintText: 'Mật khẩu chứa ít nhất 8 kí tự',
                    suffix: GestureDetector(
                      onTap: () {
                        context.read<SignUpCubit>().switchRePassword();
                      },
                      child: Image.asset(obscureRePassword
                          ? 'assets/icons/unhide.png'
                          : 'assets/icons/hidden.png'),
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
              );
            },
          ),
        ]),
      ),
    );
  }
}
