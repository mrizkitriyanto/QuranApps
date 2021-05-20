import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/darkThemeController/darkThemeProvider.dart';
import 'package:quran/darkThemeController/themeStyle.dart';
import 'package:quran/view/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider _darkThemeProvider = DarkThemeProvider();

  void getCurrentTheme() async {
    _darkThemeProvider.darkTheme =
        await _darkThemeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return _darkThemeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Al-Qur'an Indonesia",
            theme: ThemeStyles.themeData(_darkThemeProvider.darkTheme, context),
            home: OnboardingScreen(),
          );
        },
      ),
    );
  }
}
