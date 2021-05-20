import 'package:flutter/material.dart';

class MainScreenBtn extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressFtn;

  const MainScreenBtn(
      {Key key, @required this.btnText, @required this.onPressFtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        child: SizedBox(
            width: width * 0.7,
            height: height * 0.06,
            child: MaterialButton(
              color: Color(0xff049D81),
              shape: StadiumBorder(),
              onPressed: onPressFtn,
              child: Text(btnText),
            )));
  }
}
