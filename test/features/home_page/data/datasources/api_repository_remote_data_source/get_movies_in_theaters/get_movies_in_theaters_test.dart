import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/features/home_page/data/models/movie_in_theater_model.dart';

import '../../../models/models_generator.mocks.dart';
import '../api_repository_remote_data_source_test.mocks.dart';

void main() {
  group('grouped getMoviesInTheaters', () {
    late MockApiRepositoryRemoteDataSourceImpl mockApiRepository;
    late MockMovieInTheaterModel tmovieInTheaterModel;

    setUp(() {
      mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
      tmovieInTheaterModel = MockMovieInTheaterModel();
    });

    test('should return movieInTheaterModel if http call completes sucessfully',
        () async {
      when(mockApiRepository.getMoviesInTheaters())
          .thenAnswer((_) async => tmovieInTheaterModel);

      final result = await mockApiRepository.getMoviesInTheaters();

      verify(mockApiRepository.getMoviesInTheaters());
      verifyNoMoreInteractions(mockApiRepository);

      expect(result, isA<MovieInTheaterModel>());
    });
    test('should return a ServerException if http call complete with error',
        () async {
      when(mockApiRepository.getMoviesInTheaters())
          .thenThrow(ServerException());

      expect(() => mockApiRepository.getMoviesInTheaters(),
          throwsA(predicate((e) => e is ServerException)));

      verify(mockApiRepository.getMoviesInTheaters());
      verifyNoMoreInteractions(mockApiRepository);
    });
  });
}
