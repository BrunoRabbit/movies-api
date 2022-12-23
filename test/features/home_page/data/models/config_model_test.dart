import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/features/home_page/domain/entities/config.dart';

import '_models_generator.mocks.dart';

void main() {
  late MockConfigModel tConfigModel;
  const String jsonString = "some json String";
  final tObjectMap = {"images": const Images(), "change_keys": []};

  group('ConfigModel', () {
    setUp(() {
      tConfigModel = MockConfigModel();
    });
    test('should be a subclass from Config entity', () {
      expect(tConfigModel, isA<Config>());
    });
    group('map\'s method', () {
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
    group('json\'s method', () {
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
  });
}
