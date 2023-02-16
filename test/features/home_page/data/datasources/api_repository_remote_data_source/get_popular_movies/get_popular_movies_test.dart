import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/features/home_page/data/models/movie_model.dart';

import '../../../models/models_generator.mocks.dart';
import '../api_repository_remote_data_source_test.mocks.dart';

void main() {
  group(
    'grouped getPopularMovies',
    () {
      late MockApiRepositoryRemoteDataSourceImpl mockApiRepository;
      late MockMovieModel movieModel;

      setUp(() {
        mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
        movieModel = MockMovieModel();
      });

      test('should return MovieModel if http call completes sucessfully',
          () async {
        when(mockApiRepository.getPopularMovies())
            .thenAnswer((_) => Future.value(movieModel));

        final result = await mockApiRepository.getPopularMovies();

        verify(mockApiRepository.getPopularMovies());
        verifyNoMoreInteractions(mockApiRepository);

        expect(result, isA<MovieModel>());
      });
      test('should return a ServerException if http call complete with error',
          () async {
        when(mockApiRepository.getPopularMovies()).thenThrow(ServerException());

        expect(() => mockApiRepository.getPopularMovies(),
            throwsA(predicate((e) => e is ServerException)));

        verify(mockApiRepository.getPopularMovies());
        verifyNoMoreInteractions(mockApiRepository);
      });
    },
  );
}