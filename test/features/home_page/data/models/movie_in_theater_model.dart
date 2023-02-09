import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/features/home_page/domain/entities/movie_in_theater.dart';

import 'models_generator.mocks.dart';

void main() {
  late MockMovieInTheaterModel tMovieInTheaterModel;
  const String jsonString = "some json String";

  final tObjectMap = {
    "page": 0,
    "dates": const Dates(minimum: "minimum", maximum: "maximum"),
    "results": <MovieInTheaterResults>[],
    "totalPages": 0,
    "totalResults": 0,
  };

  group('movieInTheaterModel', () {
    setUp(() {
      tMovieInTheaterModel = MockMovieInTheaterModel();
    });

    test('should be a subclass from movieInTheater entity', () {
      expect(tMovieInTheaterModel, isA<MovieInTheater>());
    });

    group('map\'s method', () {
      test('should convert an object to a map', () {
        when(tMovieInTheaterModel.toMap()).thenReturn(tObjectMap);

        expect(tMovieInTheaterModel.toMap(), tObjectMap);

        reset(tMovieInTheaterModel);
      });

      test('should convert a map to a object', () {
        when(tMovieInTheaterModel.wrapperFromMap(tObjectMap))
            .thenReturn(tMovieInTheaterModel);

        expect(tMovieInTheaterModel.wrapperFromMap(tObjectMap), tMovieInTheaterModel);

        reset(tMovieInTheaterModel);
      });
    });
    group('json\'s method', () {
      test('check if is possible to convert an object to a json string', () {
        when(tMovieInTheaterModel.toJson()).thenReturn(jsonString);

        expect(tMovieInTheaterModel.toJson(), jsonString);

        reset(tMovieInTheaterModel);
      });

      test('check if is possible to create an object using a json string', () {
        when(tMovieInTheaterModel.wrapperFromJson(jsonString))
            .thenReturn(tMovieInTheaterModel);

        expect(tMovieInTheaterModel.wrapperFromJson(jsonString), tMovieInTheaterModel);

        reset(tMovieInTheaterModel);
      });
    });
  });
}
