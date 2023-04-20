

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'screens/get_password/cubit/get_password_cubit.dart';
import 'screens/sign_in/cubit/sign_in_cubit.dart';
import 'screens/forgot_password/cubit/fotgot_password_cubit.dart';
import 'screens/sign_in/sign_in_page.dart';
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
        // BlocProvider(
        //   create: (context) => ObscureBloc(),
        // ),
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
        BlocProvider(
          create: (context) => ForgotPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => GetPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: 
        // SplashScreen(),
        SignInPage(),
      ),
    );
  }
}
