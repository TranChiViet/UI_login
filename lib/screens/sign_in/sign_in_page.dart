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


class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _phoneErrorText = '';
  String _passwordErrorText = '';
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is InvalidPhoneState) {
            setState(() {
              _phoneErrorText = state.content;
            });
          }
          if (state is InvalidPasswordState) {
            setState(() {
              _passwordErrorText =state.content;
            });
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text('Đăng nhập',
                              style: TxtStyle.txt_robo_24_black_w500),
                        ),
                        TextFieldBase(
                          onChanged: (value) {
                            clearError();
                          },
                          controller: _phoneController,
                          errorText: _phoneErrorText,
                          label: 'Số điện thoại',
                          hintText: 'Nhập số điện thoại',
                          keyboardType: TextInputType.number,
                        ),
                        TextFieldBase(
                          onChanged: (value) {
                            clearError();
                          },
                          errorText: _passwordErrorText,
                          controller: _passwordController,
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
                                  BlocProvider.of<SignInCubit>(context).
                                      signin(
                                           _phoneController.text,
                                          _passwordController.text);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Bạn chưa có tài khoản?',
                          style: TxtStyle.txt_robo_16_grey_w500,
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
          );
        },
      ),
    );
  }
    void clearError() {
    setState(() {
      _phoneErrorText = '';
      _passwordErrorText = '';
    });
  }
}

