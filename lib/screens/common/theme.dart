import 'package:flutter/material.dart';

class CropifyThemes {
  static final light = ThemeData.light().copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 2, 70, 2))),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: const Color.fromARGB(255, 2, 70, 2),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromARGB(255, 2, 70, 2)),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 2, 70, 2))),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 2, 70, 2)),
        ),
      ));

  static const titleTextTheme = TextStyle(
      color: Color.fromARGB(255, 20, 9, 119),
      fontFamily: "AbhayaLibre",
      fontSize: 30,
      fontWeight: FontWeight.bold);

  static const subTextTheme = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 97, 97, 99),
      fontFamily: "AbhayaLibre");

  static const mainTextTheme = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 8, 8, 56),
      fontFamily: "AbhayaLibre");

  static const buttonTextTheme = TextStyle(
    fontSize: 20,
    fontFamily: "AbhayaLibre",
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
