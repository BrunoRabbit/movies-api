import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/features/home_page/domain/entities/movie.dart';

import 'models_generator.mocks.dart';

void main() {
  late MockMovieModel tMovieModel;
  const String jsonString = "some json String";
  final tObjectMap = {
    "page": 0,
    "results": 0,
    "totalPages": 0,
    "totalResults": <Results>[],
  };

  group('MovieModel', () {
    setUp(() {
      tMovieModel = MockMovieModel();
    });
    test('should be a subclass from Movie entity', () {
      expect(tMovieModel, isA<Movie>());
    });
    group('map\'s method', () {
      test('should convert an object to a map', () {
        when(tMovieModel.toMap()).thenReturn(tObjectMap);

        expect(tMovieModel.toMap(), tObjectMap);

        reset(tMovieModel);
      });

      test('should convert a map to a object', () {
        when(tMovieModel.wrapperFromMap(tObjectMap)).thenReturn(tMovieModel);

        expect(tMovieModel.wrapperFromMap(tObjectMap), tMovieModel);

        reset(tMovieModel);
      });
    });
    group('json\' method', () {
      test('check if is possible to convert an object to a json string', () {
        when(tMovieModel.toJson()).thenReturn(jsonString);

        expect(tMovieModel.toJson(), jsonString);

        reset(tMovieModel);
      });

      test('check if is possible to create an object using a json string', () {
        when(tMovieModel.wrapperFromJson(jsonString)).thenReturn(tMovieModel);

        expect(tMovieModel.wrapperFromJson(jsonString), tMovieModel);

        reset(tMovieModel);
      });
    });
  });
}
