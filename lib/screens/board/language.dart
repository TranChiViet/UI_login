import 'package:first_project/models/language.dart';
import 'package:flutter/material.dart';

import '../../constant/constant_export.dart';
import '../../widgets/image_base.dart';
import '../../widgets/image_logo.dart';
import '../../widgets/text_button_base.dart';
import 'intro.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final List<LanguageModel> _listLanguage = [
    LanguageModel(nation: 'Tiếng Việt', ensign: 'assets/images/vietnamese.png'),
    LanguageModel(nation: 'English', ensign: 'assets/images/english.png')
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: ImageLogo(),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Hiển Thị Ứng Dụng Bằng',
                style: TxtStyle.txt_robo_20_blue_w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Stack(alignment: Alignment.bottomCenter, children: [
                CustomPaint(
                  size: const Size(350, 200),
                  painter: RPSCustomPainter(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      children: List.generate(2, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? ColorApp.colorButtonBlueSecond
                                : ColorApp.colorWhite,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ImageBase(
                                    asset: _listLanguage[index].ensign),
                              ),
                              Text(
                                _listLanguage[index].nation,
                                style: TxtStyle.txt_robo_18_black_w500,
                              )
                            ]),
                          ),
                        ),
                      ),
                    );
                  })),
                )
              ]),
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          TextButtonBase(
              text: 'Tiếp tục',
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IntroScreen()));
              }),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;
    double r = 24;
    Paint paint0 = Paint()
      ..color = ColorApp.colorWhite
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, h * 0.200);
    path0.lineTo(0, h - r);
    path0.quadraticBezierTo(0, h, r, h);
    path0.lineTo(w - r, h);
    path0.quadraticBezierTo(w, h, w, h - r);
    path0.lineTo(w, h * 0.200 + r);
    path0.quadraticBezierTo(w, h * 0.200, w - r, h * 0.200);
    path0.lineTo(w * 0.625, h * 0.200);
    path0.lineTo(w * 0.500, 0);
    path0.lineTo(w * 0.375, h * 0.200);
    path0.lineTo(r, h * 0.200);
    path0.quadraticBezierTo(0, h * 0.200, 0, h * 0.200 + r);
    path0.close();

    canvas.drawShadow(path0.shift(const Offset(0, 5)),
        ColorApp.colorButtonBlue.withOpacity(0.3), 2.0, true);
    canvas.drawShadow(path0.shift(const Offset(0, -3)),
        ColorApp.colorButtonBlue.withOpacity(0.3), 1.0, true);
    canvas.drawShadow(path0.shift(const Offset(1, 0)),
        ColorApp.colorButtonBlue.withOpacity(0.3), 1.0, true);
    canvas.drawShadow(path0.shift(const Offset(-1, 0)),
        ColorApp.colorButtonBlue.withOpacity(0.3), 1.0, true);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
