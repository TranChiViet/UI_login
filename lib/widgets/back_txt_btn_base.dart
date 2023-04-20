import 'package:first_project/constant/constant_export.dart';
import 'package:flutter/material.dart';

import '../screens/sign_in/sign_in_page.dart';



class BackTextButtonBase extends StatelessWidget {


  const BackTextButtonBase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInPage()));
      },
      child: SizedBox(
        width: 150,
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios,
              color: ColorApp.colorTitleWOrange,
              size: 16,
            ),
            Text(
              'Trở về đăng nhập',
              style: TextStyleApp.btn_robo_16_orange_w400,
            ),
          ],
        ),
      ),
    );
  }
}
