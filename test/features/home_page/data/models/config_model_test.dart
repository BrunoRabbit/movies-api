import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/features/home_page/domain/entities/config.dart';

import '_models_generator.mocks.dart';

void main() {
  final tConfigModel = MockConfigModel();
  const String jsonString = "some json String";
  final tObjectMap = {"images": const Images(), "change_keys": []};

  test('should be a subclass from Config entity', () {
    expect(tConfigModel, isA<Config>());
  });

  group('Map', () {
    test('should convert an object to a map', () {
      when(tConfigModel.toMap()).thenReturn(tObjectMap);

      expect(tConfigModel.toMap(), tObjectMap);

      reset(tConfigModel);
    });

    test('should convert a map to a object', () {
      when(tConfigModel.wrapperFromMap(tObjectMap)).thenReturn(tConfigModel);

      expect(tConfigModel.wrapperFromMap(tObjectMap), tConfigModel);

      reset(tConfigModel);
    });
  });
  group('Json', () {
    test('check if is possible to convert an object to a json string', () {
      when(tConfigModel.toJson()).thenReturn(jsonString);

      expect(tConfigModel.toJson(), jsonString);

      reset(tConfigModel);
    });

    test('check if is possible to create an object using a json string', () {
      when(tConfigModel.wrapperFromJson(jsonString)).thenReturn(tConfigModel);

      expect(tConfigModel.wrapperFromJson(jsonString), tConfigModel);

      reset(tConfigModel);
    });
  });
}
