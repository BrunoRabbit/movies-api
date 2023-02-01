import 'package:flutter/material.dart';

class TextThemes {
  static const TextStyle _base = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );

  static TextStyle headline1 = _base.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headline2 = _base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headline3 = _base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle body1 = _base.copyWith(
    fontSize: 16,
  );

  static TextStyle body2 = _base.copyWith(
    fontSize: 14,
  );

  static TextStyle subtitle1 = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  static TextStyle subtitle2 = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );
}
