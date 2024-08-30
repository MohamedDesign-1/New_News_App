
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newnewsapp/style/app_color.dart';

class ThemeApp {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppbarColor.appbarColor,
      centerTitle: true,
      titleTextStyle: GoogleFonts.cairo(
        color: TextColor.textColorLight,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: IconColor.iconColor,
        size: 24,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      )
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.cairo(
        color: TextColor.textColorBlack,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.cairo(
        color: TextColor.textColorBlack,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.cairo(
        color: TextColor.textColorGray,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.cairo(
        color: TextColor.textColorBlack,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.cairo(
        color: TextColor.textColorBlack,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: GoogleFonts.cairo(
        color: TextColor.textColorBlack,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
    drawerTheme: DrawerThemeData(

    ),
  );
}