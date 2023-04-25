import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/text_field_base.dart';

import 'cubit/sign_up_cubit.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  String _nameErrorText = '';
  String _phoneErrorText = '';
  String _passwordErrorText = '';
  String _rePasswordErrorText = '';
  bool _obscurePassword = true;
  bool _obscureRePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is InvalidNameState) {
            setState(() {
              _nameErrorText = state.content;
            });
          }
          if (state is InvalidPhoneState) {
            setState(() {
              _phoneErrorText = state.content;
            });
          }
          if (state is InvalidPasswordState) {
            setState(() {
              _passwordErrorText = state.content;
            });
          }
          if (state is InvalidRePasswordState) {
            setState(() {
              _rePasswordErrorText = state.content;
            });
          }
          
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(children: [
                const ImageLogo(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Tạo tài khoản',
                          style: TxtStyle.txt_robo_24_black_w500),
                    ),
                    TextFieldBase(onChanged: (value) {
                            clearError();
                          },
                      controller: _nameController,
                      errorText: _nameErrorText,
                      label: 'Họ tên',
                      hintText: 'Nhập tên của bạn',
                    ),
                    TextFieldBase(onChanged: (value) {
                            clearError();
                          },
                      controller: _phoneController,
                      errorText: _phoneErrorText,
                      label: 'Số điện thoại',
                      hintText: 'Nhập số điện thoại',
                      keyboardType: TextInputType.number,
                    ),
                    TextFieldBase(onChanged: (value) {
                            clearError();
                          },
                      controller: _passwordController,
                      errorText: _passwordErrorText,
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
                    TextFieldBase(onChanged: (value) {
                            clearError();
                          },
                      controller: _rePasswordController,
                      errorText: _rePasswordErrorText,
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
                        onPressed: () {
                          BlocProvider.of<SignUpCubit>(context).signup(
                              _nameController.text,
                              _phoneController.text,
                              _passwordController.text,
                              _rePasswordController.text);
                        },
                      ),
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
      _nameErrorText = '';
      _phoneErrorText = '';
      _passwordErrorText = '';
      _rePasswordErrorText = '';
    });
  }
}
