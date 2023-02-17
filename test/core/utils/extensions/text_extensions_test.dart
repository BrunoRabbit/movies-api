import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';

void main() {
  group('TextExtensions', () {
    test('bold should return bold text style', () {
      final style = const TextStyle().bold;
      expect(style.fontWeight, equals(FontWeight.bold));
    });

    test('semiBold should return semiBold text style', () {
      final style = const TextStyle().semiBold;
      expect(style.fontWeight, equals(FontWeight.w600));
    });
    test('regular should return regular text style', () {
      final style = const TextStyle().regular;
      expect(style.fontWeight, equals(FontWeight.w400));
    });
    test('medium should return medium text style', () {
      final style = const TextStyle().medium;
      expect(style.fontWeight, equals(FontWeight.w500));
    });
    test('italic should return italic text style', () {
      final style = const TextStyle().italic;
      expect(style.fontStyle, equals(FontStyle.italic));
    });
  });
}
