import 'package:flutter/material.dart';

// const MaterialColor _red = MaterialColor(
//   _redPrimaryValue,
//   <int, Color>{
//     50: Color(0xFFFFEBEE),
//     100: Color(0xFFFFCDD2),
//     200: Color(0xFFEF9A9A),
//     300: Color(0xFFE57373),
//     400: Color(0xFFEF5350),
//     500: Color(_redPrimaryValue),
//     600: Color(0xFFE53935),
//     700: Color(0xFFD32F2F),
//     800: Color(0xFFC62828),
//     900: Color(0xFFB71C1C),
//   },
// );
// const int _redPrimaryValue = 0xffE61B39;

ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xff0F1016),
  scaffoldBackgroundColor: const Color(0xff0F0F0F),
  brightness: Brightness.dark,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF241F2B),
      elevation: 10,
      // selectedLabelStyle: TextStyle(
      //     color: Color(0xFF8D31C6), fontFamily: 'Montserrat', fontSize: 14.0),
      // unselectedLabelStyle: TextStyle(
      //     color: Color(0xFFE2D8EF), fontFamily: 'Montserrat', fontSize: 12.0),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color.fromARGB(45, 226, 216, 239),
      showUnselectedLabels: false,
      showSelectedLabels: false),
);
