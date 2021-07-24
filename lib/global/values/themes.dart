import 'package:flutter/material.dart';
import 'package:flutter_getx/global/values/values.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.PRIMARY_COLOR,
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: AppBarTheme(
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
    ),
  );
}
