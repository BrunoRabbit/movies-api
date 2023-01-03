import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/movie.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_popular_movies.dart';

import 'use_cases_generator.mocks.dart';

class MockMovie extends Mock implements Movie {}

void main() {
  late ApiRepository apiRepository;
  late GetPopularMovies usecase;

  final Movie tMovie = MockMovie();

  setUp(() {
    apiRepository = MockApiRepository();
    usecase = GetPopularMovies(apiRepository);
  });

  group('usecase GetPopularMovies', () {
    test(
      'when a successfull call occurs should return [Movie] entity',
      () async {
        when(apiRepository.getPopularMovies())
            .thenAnswer((_) async => Right(tMovie));

        final result = await usecase(NoParams());

        verify(apiRepository.getPopularMovies());
        verifyNoMoreInteractions(apiRepository);

        expect(result, Right(tMovie));
      },
    );

    test(
        'call succeeds but generates an error, it should return [ServerFailure]',
        () async {
      when(apiRepository.getPopularMovies())
          .thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase(NoParams());

      verify(apiRepository.getPopularMovies());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(ServerFailure()));
    });

    test(
        'call succeeds but generates an error, it should return [NoInternetConnection]',
        () async {
      when(apiRepository.getPopularMovies())
          .thenAnswer((_) async => Left(NoInternetConnection()));

      final result = await usecase(NoParams());

      verify(apiRepository.getPopularMovies());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(NoInternetConnection()));
    });
  });
}
