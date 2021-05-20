import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:quran/view/homeView.dart';

class OnboardingScreen extends StatelessWidget {
  final _pages = [
    PageModel(
      color: Color(0xff21014A),
        imageAssetPath: "assets/welcome.png",
        title: "Al-Quran",
        body: "\"Jika kamu menjadikan alquran sebagai panduan, maka kamu tidak akan pernah kehilangan arah.\"\n",
            doAnimateImage: true,
    ),
    PageModel(
      color: Color(0xff49014A),
        imageAssetPath: "assets/welcome2.png",
        title: "Desain Cantik & Elegan",
        body: "\"Al-Qur’an dengan desain yang cantik dan elegan akan memanjakan para pembaca\"\n",
            doAnimateImage: true,
    ),
    PageModel(
      color: Color(0xff014A42),
        imageAssetPath: "assets/welcome3.png",
        title: "Mudah Digunakan",
        body: "\"Al-Qur’an dengan penggunaan yang mudah\"\n",
            doAnimateImage: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(pages: _pages,
      showBullets: true,
      skipCallback: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HomeView(),
          ),
      ),
      finishCallback: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HomeView(),
          ),
      ),
      ),
    );
  }
}
