import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/screens/get_password/cubit/get_password_cubit.dart';
import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/text_field_base.dart';

class GetPasswordPage extends StatelessWidget {
  const GetPasswordPage({super.key});

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
          BlocBuilder<GetPasswordCubit, GetPasswordState>(
            builder: (context, state) {
              bool obscurePassword = state.obscurePassword;
              bool obscureNewPassword = state.obscureNewPassword;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Quên mật khẩu',
                        style: TextStyleApp.txt_robo_24_black_w500),
                  ),
                  Text('Vui lòng nhập mật khẩu mới của bạn.',
                      style: TextStyleApp.txt_robo_16_black_w400),
                  TextFieldBase(
                    obscureText: !obscureNewPassword,
                    label: 'Mật khẩu mới',
                    hintText: 'Mật khẩu chứa ít nhất 8 kí tự',
                    suffix: GestureDetector(
                      onTap: () {
                        context.read<GetPasswordCubit>().switchNewPassword();
                      },
                      child: Image.asset(obscureNewPassword
                          ? 'assets/icons/unhide.png'
                          : 'assets/icons/hidden.png'),
                    ),
                  ),
                  TextFieldBase(
                    obscureText: !obscurePassword,
                    label: 'Xác nhận mật khẩu',
                    hintText: 'Nhập lại mật khẩu mới',
                    suffix: GestureDetector(
                      onTap: () {
                        context.read<GetPasswordCubit>().switchPassword();
                      },
                      child: Image.asset(obscurePassword
                          ? 'assets/icons/unhide.png'
                          : 'assets/icons/hidden.png'),
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
              );
            },
          ),
        ]),
      ),
    );
  }
}
