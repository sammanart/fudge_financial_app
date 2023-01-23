import 'package:flutter/material.dart';

/// Colors used across the app
class AppColors {
  static const black = Color(0xff000000);
  static const white = Color(0xffFFFFFF);
  static const blue = Color(0xff147AD6);
  static const blueCharcoal = Color(0xff171D3C);
  static const darkBlue = Color(0xff111B36);
  static const lightGrey = Color(0xffB4B8D1);
  static const grey = Color(0xff707070);
  static const fontGrey = Color(0xff7C828A);
  static const indicatorGrey = Color(0xffCED5E0);
  static const green = Color(0xff3CD942);
  static const darkGreen = Color(0xff3A5900);
  static const lightGreen = Color(0xffA9DE8E);
  static const orange = Color(0xffD98E38);
  static const red = Color(0xffEC6666);
  static const teal = Color(0xff7AD2DE);
  static const lightPurple = Color(0xffB4B9D1);
  static const darkPurple = Color(0xff2F275C);
}

class AppTheme {
  /// Default font
  static const String _fontFamily = 'Roboto';

  /// App theme
  static final ThemeData theme = ThemeData(
    fontFamily: _fontFamily,
    textTheme: _textTheme,
  );

  /// App main text styles
  static const _textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    headline2: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    headline3: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    headline4: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    headline5: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    headline6: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
  );
}
