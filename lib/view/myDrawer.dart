import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/darkThemeController/darkThemeProvider.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height,
      child: Material(
        color: themeChange.darkTheme ? Colors.black : Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(children: [
            Center(
              child: Switch(
                value: themeChange.darkTheme,
                onChanged: (value) {
                  themeChange.darkTheme = value;
                },
                )
            )
          ],)
        )
      )
    );
  }
}