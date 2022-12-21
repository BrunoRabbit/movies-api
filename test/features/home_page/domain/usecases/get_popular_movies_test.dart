import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/movie.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_popular_movies.dart';

import '.use_cases_generator.mocks.dart';

void main() {
  MockApiRepository mockApiRepository = MockApiRepository();
  GetPopularMovies usecase = GetPopularMovies(mockApiRepository);

  const int? _kPage = 1;
  const List<Results>? _kResults = <Results>[];
  const int? _kTotalPages = 1;
  const int? _kTotalResults = 1;

  const tMovies = Movie(
    page: _kPage,
    results: _kResults,
    totalPages: _kTotalPages,
    totalResults: _kTotalResults,
  );

  test(
    'Should return true if getPopularMovies is called',
    () async {
      when(mockApiRepository.getPopularMovies())
          .thenAnswer((_) async => const Right(tMovies));
      final result = await usecase(NoParams());

      expect(result, const Right(tMovies));

      verify(mockApiRepository.getPopularMovies());

      verifyNoMoreInteractions(mockApiRepository);
    },
  );
}
