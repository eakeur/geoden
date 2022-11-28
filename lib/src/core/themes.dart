import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.green[900],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(50),
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontVariations: [FontVariation("wght", 900)],
      ),
    )),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.green[900]),
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
      labelStyle:
          GoogleFonts.poppins().copyWith(fontSize: 14, color: Colors.black),
      focusColor: Colors.green,
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green)),
      errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38)),
    ),
  );
}

ThemeData fireThemeData() {
  var theme = defaultThemeData();
  return theme.copyWith(
    scaffoldBackgroundColor: Colors.amber[200],
    colorScheme: ColorScheme.light(
      primary: Colors.orange[900]!,
      secondary: Colors.orange,
    ),
    appBarTheme: theme.appBarTheme.copyWith(
      iconTheme: IconThemeData(color: Colors.orange[900]),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.orange[900]),
    inputDecorationTheme: theme.inputDecorationTheme.copyWith(
      focusColor: Colors.orange[900],
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.orange[900]!, width: 3),
      ),
    ),
  );
}
