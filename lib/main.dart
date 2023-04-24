

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'screens/sign_in/sign_in_page.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: Colors.blue,
        ),
        home: 
        // SplashScreen(),
        SignInPage(),
      
    );
  }
}
