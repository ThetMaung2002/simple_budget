import 'package:flutter/material.dart';
import 'package:simple_budget/constants/theme_constants/light_theme_constants.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    background: backgroundColor,
    onBackground: textColor,
    primary: primaryColor,
    onPrimary: primaryFgColor,
    secondary: secondaryColor,
    onSecondary: secondaryFgColor,
    tertiary: accentColor,
    onTertiary: accentFgColor,
    surface: backgroundColor,
    onSurface: textColor,
    error: Brightness.light == Brightness.light
        ? Color(0xffB3261E)
        : Color(0xffF2B8B5),
    onError: Brightness.light == Brightness.light
        ? Color(0xffFFFFFF)
        : Color(0xff601410),
  ),
);
