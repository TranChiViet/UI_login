import 'dart:async';

import 'package:first_project/constant/constant_export.dart';
import 'package:flutter/material.dart';

import '../../widgets/image_logo.dart';
import 'intro.dart';
import 'language.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LanguageScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: ColorApp.colorWhite,
        child: const ImageLogo(),
      )),
    );
  }
}