import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/features/home_page/domain/entities/trending.dart';

import 'models_generator.mocks.dart';

void main() {
  late MockTrendingModel tTrendingModel;
  const String jsonString = "some json String";
  final tObjectMap = {
    "page": 0,
    "results": 0,
    "totalPages": 0,
    "totalResults": <TrendingsDetails>[],
  };

  group('TrendingModel', () {
    setUp(() {
      tTrendingModel = MockTrendingModel();
    });
    test('should be a subclass from trending entity', () {
      expect(tTrendingModel, isA<Trending>());
    });
    group('map\'method', () {
      test('should convert an object to a map', () {
        when(tTrendingModel.toMap()).thenReturn(tObjectMap);

        expect(tTrendingModel.toMap(), tObjectMap);

        reset(tTrendingModel);
      });

      test('should convert a map to a object', () {
        when(tTrendingModel.wrapperFromMap(tObjectMap))
            .thenReturn(tTrendingModel);

        expect(tTrendingModel.wrapperFromMap(tObjectMap), tTrendingModel);

        reset(tTrendingModel);
      });
    });
    group('json\' method', () {
      test('check if is possible to convert an object to a json string', () {
        when(tTrendingModel.toJson()).thenReturn(jsonString);

        expect(tTrendingModel.toJson(), jsonString);

        reset(tTrendingModel);
      });

      test('check if is possible to create an object using a json string', () {
        when(tTrendingModel.wrapperFromJson(jsonString))
            .thenReturn(tTrendingModel);

        expect(tTrendingModel.wrapperFromJson(jsonString), tTrendingModel);

        reset(tTrendingModel);
      });
    });
  });
}
