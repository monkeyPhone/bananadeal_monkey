import 'package:banana_deal_by_monkeycompany/package/common/size/common_size.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeConfig {
  final CommonSize size;
  final bool isDark;
  final ThemeData theme;

  ThemeConfig({
    required this.size,
    required this.isDark
  }) :
    theme =  ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(
            brightness: isDark ? Brightness.dark : Brightness.light,
            seedColor: yellow,
            primary: yellow,
            onPrimary: brown,
            secondary: bananaGreen,
            onSecondary: yellowCheck,
            tertiary: Colors.blue,
            onTertiary: cocacolaRed,
            error: greyCCCCCC,
            onError: greyD9D9D9,
            surface: isDark ? blackWrite : white,
            onSurface: isDark ? white : blackWrite,
            surfaceDim: Colors.transparent,
            surfaceContainer: greyF4F4F4,
            surfaceContainerLow: greyEAEAEA,
            surfaceContainerLowest: Colors.grey.shade400,

        ),
        dialogTheme: DialogThemeData(
          backgroundColor: isDark ? blackWrite : white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(size.dialogCircular))
          ),
        ),
        disabledColor: greyButtonDisable,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: size.titleMain,
            fontWeight: FontWeight.w600
          ),
          displaySmall: TextStyle(
              fontSize: size.titleMain,
              fontWeight: FontWeight.w400
          ),

          titleLarge: TextStyle(
              fontSize: size.titleButton,
              fontWeight: FontWeight.w600
          ),

          titleMedium: TextStyle(
              fontSize: size.titleLittle,
              fontWeight: FontWeight.w400
          ),

          titleSmall: TextStyle(
              fontSize: size.titleButton,
              fontWeight: FontWeight.w400
          ),

          bodyLarge: TextStyle(
              fontSize: size.body,
              fontWeight: FontWeight.w600
          ),
          bodySmall: TextStyle(
              fontSize: size.body,
              fontWeight: FontWeight.w400
          ),

          headlineLarge: TextStyle(
              fontSize: size.callout,
              fontWeight: FontWeight.w600
          ),

          headlineSmall: TextStyle(
              fontSize: size.callout,
              fontWeight: FontWeight.w400
          ),


          labelLarge: TextStyle(
              fontSize: size.sub,
              fontWeight: FontWeight.w400
          ),
          labelSmall: TextStyle(
              fontSize: size.sub,
              fontWeight: FontWeight.w400
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