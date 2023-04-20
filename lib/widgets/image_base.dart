import 'package:flutter/material.dart';

class ImageBase extends StatelessWidget {
  final String asset;
  final Color? color;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const ImageBase(
      {required this.asset,
      this.color,
      this.fit,
      this.height,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
   return Image.asset(asset,
          color: color, height: height, width: width, fit: fit ?? BoxFit.fill);
    
  }
}