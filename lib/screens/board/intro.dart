import 'package:first_project/constant/constant_export.dart';
import 'package:first_project/widgets/image_base.dart';
import 'package:flutter/material.dart';

import '../../models/intro.dart';
import '../../widgets/back_txt_btn_base.dart';
import '../../widgets/elevated_button_base.dart';
import '../../widgets/image_logo.dart';
import '../../widgets/otp_base.dart';
import '../../widgets/text_button_base.dart';
import '../../widgets/text_field_base.dart';
import '../sign_in/sign_in_page.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<IntroModel> _listIntro = [
    IntroModel(
        title: 'Yến Pronest xin chào!',
        image: 'assets/images/intro1.png',
        description:
            'Chúng tôi cung cấp trọn gói hệ thống thiết bị lắp đặt nhà yến.'),
    IntroModel(
        title: 'Ứng dụng điều khiển thông minh',
        image: 'assets/images/intro2.png',
        description:
            'Hỗ trợ lắp đặt, tích hợp ứng dụng điều khiển thông minh.'),
    IntroModel(
        title: 'Bảo hành - Bảo trì thiết bị',
        image: 'assets/images/intro3.png',
        description:
            'Quan tâm sát sao đến việc bảo hành - bảo trì sản phẩm, cũng như tư vấn tận tâm cho Quý khách.')
  ];
  final PageController _pagecontroller = PageController();

  int _indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pagecontroller,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                onPageChanged: (index) {
                  setState(() {
                    _indexPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: ImageLogo(),
                      ),
                      ImageBase(asset: _listIntro[index].image),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30, top: 20),
                        child: Text(_listIntro[index].title,
                            style: TextStyleApp.txt_robo_20_blue_w600),
                      ),
                      Text(_listIntro[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyleApp.txt_robo_16_grey_w400)
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: TextButtonBase(
                text: _indexPage < 2 ? 'Bỏ qua' : ' ',
                enableColor: false,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                }),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInCubic,
                          height: 10,
                          width: _indexPage == index ? 20 : 10,
                          decoration: BoxDecoration(
                              color: _indexPage == index
                                  ? ColorApp.colorTitleBlue
                                  : ColorApp.colorTitleGrey,
                              borderRadius: BorderRadius.circular(10)),
                        ));
                  })),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButtonBase(
                text: _indexPage < 2 ? 'Tiếp' : 'Bắt đầu',
                onPressed: () {
                  setState(() {
                    _indexPage < 2
                        ? _pagecontroller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInCubic)
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                  });
                }),
          ),
        ],
      ),
    );
  }
}
