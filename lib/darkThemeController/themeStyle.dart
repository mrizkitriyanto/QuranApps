import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeStyles {
  static ThemeData themeData(bool isDarktheme, BuildContext context) {
    return isDarktheme
        ? ThemeData(
            primarySwatch: Colors.grey,
            primaryColor: Colors.black,
            brightness: Brightness.dark,
            backgroundColor: Color(0xff000000),
            accentColor: Color(0xff896277),
            accentIconTheme: IconThemeData(color: Colors.black),
            dividerColor: Colors.black12,
            textTheme: TextTheme(
              headline1: GoogleFonts.roboto(
                fontSize: 42,
                fontWeight: FontWeight.w600,
              ),
              headline2: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              bodyText1: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              caption: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        : ThemeData(
          primarySwatch: Colors.teal,
            primaryColor: Colors.teal,
            brightness: Brightness.light,
            backgroundColor: Color(0xffE5E5E5),
            accentColor: Color(0xff896277),
            accentIconTheme: IconThemeData(color: Colors.white),
            dividerColor: Colors.white60,
            textTheme: TextTheme(
              headline1: GoogleFonts.roboto(
                fontSize: 42,
                fontWeight: FontWeight.w600,
              ),
              headline2: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              bodyText1: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              caption: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,

              ),
            ),
        );
  }
}
