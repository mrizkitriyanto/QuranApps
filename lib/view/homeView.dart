import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/darkThemeController/darkThemeProvider.dart';
import 'package:quran/view/myDrawer.dart';
import 'package:quran/widget/mainScreenBtn.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  bool _canBeDragged;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = animationController.isDismissed;
    bool isDragCloseFromRight = animationController.isCompleted;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / 280;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    double _minFlingVelocity = 365.0;

    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }

    if (details.velocity.pixelsPerSecond.dx.abs() >= _minFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
    } else if (animationController.value < 0.5) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      behavior: HitTestBehavior.translucent,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Material(
            color: themeChange.darkTheme ? Colors.black : Colors.white70,
            child: SafeArea(
                child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(280 * (animationController.value - 1), 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(2, 2, 0.001)
                      ..rotateY(math.pi / 2 * (1 - animationController.value)),
                    alignment: Alignment.centerRight,
                    child: MyDrawer(),
                  ),
                ),
                Transform.translate(
                  offset: Offset(280 * animationController.value, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(2, 2, 0.001)
                      ..rotateY(-math.pi / 2 * animationController.value),
                    alignment: Alignment.centerLeft,
                    child: MainView(),
                  ),
                ),
                Positioned(
                  top: 4.0 + MediaQuery.of(context).padding.top,
                  left: MediaQuery.of(context).size.width * 0.01 +
                      animationController.value * 280,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: toggle,
                    color:
                        themeChange.darkTheme ? Colors.white70 : Colors.black,
                  ),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width,
      color: themeChange.darkTheme ? Colors.black : Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: height * 0.12,
            left: width * 0.030,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Al",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  "Qur'an\nIndonesia",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ),
          Positioned(
            left: width * 0.3,
            top: height * (-0.04),
            child: Image.asset(
              'assets/gambarUtama.png',
              height: height * 0.35,
            ),
          ),
          Positioned(
            right: width * 0.15,
            top: height * 0.35,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainScreenBtn(btnText: "BACA QUR'AN", onPressFtn: () {}),
                MainScreenBtn(btnText: "TERAKHIR BACA", onPressFtn: () {}),
                MainScreenBtn(btnText: "JADWAL SHOLAT", onPressFtn: () {}),
                MainScreenBtn(btnText: "PENGATURAN", onPressFtn: () {}),
              ],
            ),
          ),
          Positioned(
            left: width * 0.02,
            bottom: height * 0.01,
              child: Opacity(
            opacity: 0.1,
            child: Image.asset('assets/quranRail.png',
            height: height * 0.4,
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Allah is with the believers.\n ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  "(Q.S Al-Anfal: 19)\n\n",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
