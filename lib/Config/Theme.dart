import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Config/Colors.dart';

// ============================================
// PREMIUM PROFESSIONAL THEME
// Modern, responsive, and performance-optimized
// ============================================

var lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: lightBgColor,
  splashColor: lightPrimaryColor.withOpacity(0.1),
  highlightColor: lightPrimaryColor.withOpacity(0.05),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: lightFontColor,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    iconTheme: IconThemeData(color: lightFontColor),
    titleTextStyle: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      color: lightFontColor,
      fontWeight: FontWeight.w600,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: lightCardColor,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: lightDivColor, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: lightPrimaryColor, width: 2),
    ),
    prefixIconColor: lightLableColor,
    labelStyle: const TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      color: lightLableColor,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: const TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      color: lightLableColor,
      fontWeight: FontWeight.w400,
    ),
  ),
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    surface: lightBgColor,
    onSurface: lightFontColor,
    primaryContainer: lightCardColor,
    onPrimaryContainer: lightFontColor,
    secondaryContainer: lightSecondaryColor,
    onSecondaryContainer: Colors.white,
    secondary: lightSecondaryColor,
    primary: lightPrimaryColor,
    onPrimary: Colors.white,
    error: errorColor,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 32,
      color: lightFontColor,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.5,
    ),
    headlineLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 28,
      color: lightFontColor,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    headlineMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 24,
      color: lightFontColor,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.3,
    ),
    headlineSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      color: lightFontColor,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      color: lightFontColor,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 16,
      color: lightFontColor,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      color: lightFontColor,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 13,
      color: lightFontColor,
      fontWeight: FontWeight.w400,
      height: 1.4,
    ),
    labelLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      color: lightLableColor,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 12,
      color: lightLableColor,
      fontWeight: FontWeight.w400,
    ),
  ),
);
var darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: darkBgColor,
  splashColor: darkPrimaryColor.withOpacity(0.1),
  highlightColor: darkPrimaryColor.withOpacity(0.05),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: darkFontColor,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(color: darkFontColor),
    titleTextStyle: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      color: darkFontColor,
      fontWeight: FontWeight.w600,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    surface: darkBgColor,
    onSurface: darkFontColor,
    primaryContainer: darkCardColor,
    onPrimaryContainer: darkFontColor,
    secondaryContainer: darkSecondaryColor,
    onSecondaryContainer: darkBgColor,
    secondary: darkSecondaryColor,
    primary: darkPrimaryColor,
    onPrimary: darkBgColor,
    error: errorColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: darkCardColor,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: darkDivColor, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: darkPrimaryColor, width: 2),
    ),
    prefixIconColor: darkLableColor,
    labelStyle: const TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      color: darkLableColor,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: const TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      color: darkLableColor,
      fontWeight: FontWeight.w400,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 32,
      color: darkFontColor,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.5,
    ),
    headlineLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 28,
      color: darkFontColor,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    headlineMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 24,
      color: darkFontColor,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.3,
    ),
    headlineSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      color: darkFontColor,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      color: darkFontColor,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 16,
      color: darkFontColor,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      color: darkFontColor,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 13,
      color: darkFontColor,
      fontWeight: FontWeight.w400,
      height: 1.4,
    ),
    labelLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      color: darkLableColor,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 12,
      color: darkLableColor,
      fontWeight: FontWeight.w400,
    ),
  ),
);
