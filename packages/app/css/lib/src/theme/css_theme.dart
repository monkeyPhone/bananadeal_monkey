import 'package:css/css.dart';
import 'package:css/src/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CssTheme {
  final CssSize size;
  final ThemeData themeLight;

  CssTheme({
    required this.size,
  }) :
        themeLight =  ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: yellow,
            primary: bdYellow,
            onPrimary: bdDarkNavy,
            secondary: bdGreen,
            onSecondary: bdLightYellow,
            tertiary: honeyPurple,
            onTertiary: honeyDarkPurple,
            error: honeyDarkGrey,
            onError: honeyGrey,
            surface: white,
            onSurface: etcBlack,
            surfaceDim: Colors.transparent,
            surfaceContainer: bdCoral,
            surfaceContainerLow: greyEAEAEA,
            surfaceContainerLowest: yellow,
        ),
        dialogTheme: DialogThemeData(
          backgroundColor:  white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(size.dialogCircular))
          ),
        ),
        disabledColor: greyButtonDisable,
        textTheme: TextTheme(
          displayMedium: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: size.largeTitle,
              fontWeight: FontWeight.w700
          ),
          titleMedium: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: size.subTitle,
              fontWeight: FontWeight.w600
          ),
          bodyMedium: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: size.body01,
              fontWeight: FontWeight.w400
          ),
          bodySmall: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: size.body02,
              fontWeight: FontWeight.w400
          ),
          headlineMedium: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: size.button,
              fontWeight: FontWeight.w500
          ),
          labelLarge: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: size.caption,
              fontWeight: FontWeight.w300
          ),
        ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: white,
        surfaceTintColor: white,
      ),
      scaffoldBackgroundColor: white,
    );




}