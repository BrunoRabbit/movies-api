import 'package:flutter_test/flutter_test.dart';
import 'package:movies_api/core/utils/extensions/verify_null.dart';

void main() {
  group('VerifyNull', () {
    // ? values not null
    test('Verify if a double value is not null', () {
      double? value = 10.0;

      final result = value.notNull();

      expect(result, 10.0);
    });

    test('Verify if a int value not null', () {
      int? value = 1;

      final result = value.notNull();

      expect(result, 1);
    });
    test('Verify if a String value not null', () {
      String? value = "0";

      final result = value.notNull();

      expect(result, "0");
    });
    test('Verify if a bool value not null', () {
      bool? value = true;

      final result = value.notNull();

      expect(result, true);
    });
    test('Verify if a Object value not null', () {
      Object? value = Object();

      final result = value.notNull();

      expect(result, isA<Object>());
    });
    test('Verify if a List<int> value not null', () {
      List<int>? value = <int>[0, 1, 2, 3];

      final result = value.notNull();

      expect(result, [0, 1, 2, 3]);
    });
    test('Verify if a List<double> value not null', () {
      List<double>? value = <double>[0, 0, 1.0, 2.0, 3.0];

      final result = value.notNull();

      expect(result, [0, 0, 1.0, 2.0, 3.0]);
    });
    test('Verify if a List<String> value not null', () {
      List<String>? value = <String>["0", "1", "2", "3"];

      final result = value.notNull();

      expect(result, ["0", "1", "2", "3"]);
    });
    test('Verify if a List<bool> value not null', () {
      List<bool>? value = <bool>[true, false, false, true];

      final result = value.notNull();

      expect(result, [true, false, false, true]);
    });

    // ? values is null
    test('Verify if a double value is null', () {
      double? value;

      final result = value.notNull();

      expect(result, null);
    });
    test('Verify if a int value is null', () {
      int? value;

      final result = value.notNull();

      expect(result, null);
    });
    test('Verify if a String value is null', () {
      String? value;

      final result = value.notNull();

      expect(result, null);
    });
    test('Verify if a bool value is null', () {
      bool? value;

      final result = value.notNull();

      expect(result, null);
    });
    test('Verify if a Object value is null', () {
      Object? value;

      final result = value.notNull();

      expect(result, null);
    });

    test('Verify if a List<int> value is null', () {
      int? value;

      final result = value.notNull();

      expect(result, null);
    });

    test('Verify if a List<double> value is null', () {
      List<double>? value;

      final result = value.notNull();

      expect(result, null);
    });
    test('Verify if a List<String> value is null', () {
      List<String>? value;

      final result = value.notNull();

      expect(result, null);
    });
    test('Verify if a List<bool> value is null', () {
      List<bool>? value;

      final result = value.notNull();

      expect(result, null);
    });
  });
}
