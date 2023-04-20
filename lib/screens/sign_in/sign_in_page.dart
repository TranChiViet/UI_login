import 'package:first_project/constant/constant_export.dart';

import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/elevated_button_base.dart';
import '../../widgets/text_button_base.dart';
import '../../widgets/text_field_base.dart';
import '../forgot_password/forgot_password.dart';
import '../sign_up/sign_up_page.dart';
import 'cubit/sign_in_cubit.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: ImageLogo(),
                ),
                BlocBuilder<SignInCubit, SignInState>(
                  builder: (context, state) {
                    bool showPassword = state.showPassword;
                    bool correctPassword = state.correctPassword;
                    bool correctPhone = state.correctPhone;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text('Đăng nhập',
                              style: TextStyleApp.txt_robo_24_black_w500),
                        ),
                        TextFieldBase(
                          label: 'Số điện thoại',
                          hintText: 'Nhập số điện thoại',
                          correct: correctPhone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              context.read<SignInCubit>().switchUnCorrectPhone();
                            } else {
                              
                              context.read<SignInCubit>().switchCorrectPhone();
                            }
                          },
                        ),
                        correctPhone
                            ? const Text('')
                            : Text(
                                'Nhập lại số điện thoại',
                                style: TextStyleApp.txt_robo_16_red_w400,
                              ),
                        TextFieldBase(
                          obscureText: !showPassword,
                          label: 'Mật khẩu',
                          hintText: 'Mật khẩu chứa ít nhất 8 kí tự',
                          correct: correctPassword,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return context
                                  .read<SignInCubit>()
                                  .switchUnCorrectPass();
                            } else {
                              return context.read<SignInCubit>().switchCorrectPass();
                              
                            }
                          },
                          suffix: GestureDetector(
                            onTap: () {
                              context.read<SignInCubit>().switchObscure();
                            },
                            child: Image.asset(showPassword
                                ? 'assets/icons/unhide.png'
                                : 'assets/icons/hidden.png'),
                          ),
                        ),
                        correctPassword
                            ? const Text('')
                            : Text(
                                'Nhập lại mật khẩu',
                                style: TextStyleApp.txt_robo_16_red_w400,
                              ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButtonBase(
                              text: 'Quên mật khẩu?',
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                             ForgotPasswordPage()));
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButtonBase(
                                text: 'Đăng nhập',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                  
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Column(
                  children: [
                    Text(
                      'Bạn chưa có tài khoản?',
                      style: TextStyleApp.txt_robo_16_grey_w500,
                    ),
                    TextButtonBase(
                      text: 'Tạo tài khoản ngay',
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
