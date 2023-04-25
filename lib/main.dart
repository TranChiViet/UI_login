import 'package:first_project/screens/board/splash.dart';
import 'package:first_project/screens/get_password/bloc/get_password_bloc.dart';
import 'package:first_project/screens/otp/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/forgot_password/bloc/forgot_password_bloc.dart';
import 'screens/otp/bloc/otp_bloc.dart';
import 'screens/sign_in/bloc/sign_in_bloc.dart';
import 'screens/sign_in/sign_in_page.dart';
import 'screens/sign_up/bloc/sign_up_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: SignInBloc()),
        BlocProvider.value(value: SignUpBloc()),
        BlocProvider.value(value: ForgotPasswordBloc()),
        BlocProvider.value(value: OtpBloc()),
        BlocProvider.value(value: GetPasswordBloc()),
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
            // SignInPage(),
            // OtpPage(),
      ),
    );
  }
}
