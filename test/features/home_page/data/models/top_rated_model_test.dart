import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/features/home_page/domain/entities/top_rated.dart';

import 'models_generator.mocks.dart';

void main() {
  late MockTopRatedModel tTopRatedModel;
  const String jsonString = "some json String";

  final tObjectMap = {
    "page": 0,
    "results": 0,
    "totalPages": 0,
    "totalResults": <TopRatedDetails>[],
  };

  group('TopRatedModel', () {
    setUp(() {
      tTopRatedModel = MockTopRatedModel();
    });

    test('should be a subclass from TopRated entity', () {
      expect(tTopRatedModel, isA<TopRated>());
    });

    group('map\'s method', () {
      test('should convert an object to a map', () {
        when(tTopRatedModel.toMap()).thenReturn(tObjectMap);

        expect(tTopRatedModel.toMap(), tObjectMap);

        reset(tTopRatedModel);
      });

      test('should convert a map to a object', () {
        when(tTopRatedModel.wrapperFromMap(tObjectMap))
            .thenReturn(tTopRatedModel);

        expect(tTopRatedModel.wrapperFromMap(tObjectMap), tTopRatedModel);

        reset(tTopRatedModel);
      });
    });
    group('json\'s method', () {
      test('check if is possible to convert an object to a json string', () {
        when(tTopRatedModel.toJson()).thenReturn(jsonString);

        expect(tTopRatedModel.toJson(), jsonString);

        reset(tTopRatedModel);
      });

      test('check if is possible to create an object using a json string', () {
        when(tTopRatedModel.wrapperFromJson(jsonString))
            .thenReturn(tTopRatedModel);

        expect(tTopRatedModel.wrapperFromJson(jsonString), tTopRatedModel);

        reset(tTopRatedModel);
      });
    });
  });
}
