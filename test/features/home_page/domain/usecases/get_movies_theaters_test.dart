import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/movie_in_theater.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_movies_in_theaters.dart';

import 'use_cases_generator.mocks.dart';

class MockMovieInTheater extends Mock implements MovieInTheater {}

void main() {
  late ApiRepository apiRepository;
  late GetMoviesInTheaters usecase;

  final MovieInTheater tMovieInTheater = MockMovieInTheater();

  setUp(() {
    apiRepository = MockApiRepository();
    usecase = GetMoviesInTheaters(apiRepository);
  });

  group('usecase GetMoviesTheaters', () {
    test(
      'when a successfull call occurs should return [movieInTheater] entity',
      () async {
        when(apiRepository.getMoviesInTheaters())
            .thenAnswer((_) async => Right(tMovieInTheater));

        final result = await usecase(NoParams());

        verify(apiRepository.getMoviesInTheaters());
        verifyNoMoreInteractions(apiRepository);

        expect(result, Right(tMovieInTheater));
      },
    );

    test(
        'call succeeds but generates an error, it should return [ServerFailure]',
        () async {
      when(apiRepository.getMoviesInTheaters())
          .thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase(NoParams());

      verify(apiRepository.getMoviesInTheaters());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(ServerFailure()));
    });

    test(
        'call succeeds but generates an error, it should return [NoInternetConnection]',
        () async {
      when(apiRepository.getMoviesInTheaters())
          .thenAnswer((_) async => Left(NoInternetConnection()));

      final result = await usecase(NoParams());

      verify(apiRepository.getMoviesInTheaters());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(NoInternetConnection()));
    });
  });
}
