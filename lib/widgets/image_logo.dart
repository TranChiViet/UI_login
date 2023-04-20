import 'package:flutter/material.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        width: 250,
        child: Image.asset(
          'assets/images/LOGO.png',
          fit: BoxFit.cover,
        ));
  }
}
