import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/features/home_page/domain/entities/movie_theater.dart';

import 'models_generator.mocks.dart';

void main() {
  late MockMovieTheaterModel tMovieTheaterModel;
  const String jsonString = "some json String";

  final tObjectMap = {
    "page": 0,
    "dates": const Dates(minimum: "minimum", maximum: "maximum"),
    "results": <MovieTheaterResults>[],
    "totalPages": 0,
    "totalResults": 0,
  };

  group('MovieTheaterModel', () {
    setUp(() {
      tMovieTheaterModel = MockMovieTheaterModel();
    });

    test('should be a subclass from MovieTheater entity', () {
      expect(tMovieTheaterModel, isA<MovieTheater>());
    });

    group('map\'s method', () {
      test('should convert an object to a map', () {
        when(tMovieTheaterModel.toMap()).thenReturn(tObjectMap);

        expect(tMovieTheaterModel.toMap(), tObjectMap);

        reset(tMovieTheaterModel);
      });

      test('should convert a map to a object', () {
        when(tMovieTheaterModel.wrapperFromMap(tObjectMap))
            .thenReturn(tMovieTheaterModel);

        expect(tMovieTheaterModel.wrapperFromMap(tObjectMap), tMovieTheaterModel);

        reset(tMovieTheaterModel);
      });
    });
    group('json\'s method', () {
      test('check if is possible to convert an object to a json string', () {
        when(tMovieTheaterModel.toJson()).thenReturn(jsonString);

        expect(tMovieTheaterModel.toJson(), jsonString);

        reset(tMovieTheaterModel);
      });

      test('check if is possible to create an object using a json string', () {
        when(tMovieTheaterModel.wrapperFromJson(jsonString))
            .thenReturn(tMovieTheaterModel);

        expect(tMovieTheaterModel.wrapperFromJson(jsonString), tMovieTheaterModel);

        reset(tMovieTheaterModel);
      });
    });
  });
}
