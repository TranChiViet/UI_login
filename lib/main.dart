import 'package:first_project/screens/board/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/forgot_password/cubit/forgot_password_cubit.dart';

import 'screens/get_password/cubit/get_password_cubit.dart';
import 'screens/otp/cubit/otp_cubit.dart';
import 'screens/sign_in/cubit/sign_in_cubit.dart';
import 'screens/sign_up/cubit/sign_up_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: SignInCubit()),
        BlocProvider.value(value: SignUpCubit()),
        BlocProvider.value(value: ForgotPasswordCubit()),
        BlocProvider.value(value: OtpCubit()),
        BlocProvider.value(value: GetPasswordCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: Colors.blue,
        ),
        home:
            SplashScreen(),
      ),
    );
  }
}
