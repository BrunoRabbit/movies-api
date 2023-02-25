import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/features/search_page/domain/entities/search_result.dart';

import 'search_model_test_generate.mocks.dart';

void main() {
  late MockSearchResultModel tSearchModel;
  const String jsonString = "some json String";

  final tObjectMap = {
    "page": 0,
    "results": <SearchQueryResults>[],
    "totalPages": 0,
    "totalResults": 0,
  };

  group('SearchResultModel', () {
    setUp(() {
      tSearchModel = MockSearchResultModel();
    });
    test('should be a subclass from SearchResult entity', () {
      expect(tSearchModel, isA<SearchResult>());
    });
    group('map\'s method', () {
      test('should convert an object to a map', () {
        when(tSearchModel.toMap()).thenReturn(tObjectMap);

        expect(tSearchModel.toMap(), tObjectMap);

        reset(tSearchModel);
      });

      test('should convert a map to a object', () {
        when(tSearchModel.wrapperFromMap(tObjectMap)).thenReturn(tSearchModel);

        expect(tSearchModel.wrapperFromMap(tObjectMap), tSearchModel);

        reset(tSearchModel);
      });
    });
    group('json\'s method', () {
      test('check if is possible to convert an object to a json string', () {
        when(tSearchModel.toJson()).thenReturn(jsonString);

        expect(tSearchModel.toJson(), jsonString);

        reset(tSearchModel);
      });

      test('check if is possible to create an object using a json string', () {
        when(tSearchModel.wrapperFromJson(jsonString)).thenReturn(tSearchModel);

        expect(tSearchModel.wrapperFromJson(jsonString), tSearchModel);

        reset(tSearchModel);
      });
    });
  });
}
