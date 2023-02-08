import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/movie_theater.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_movies_theaters.dart';

import 'use_cases_generator.mocks.dart';

class MockMovieTheater extends Mock implements MovieTheater {}

void main() {
  late ApiRepository apiRepository;
  late GetMoviesTheaters usecase;

  final MovieTheater tMovieTheater = MockMovieTheater();

  setUp(() {
    apiRepository = MockApiRepository();
    usecase = GetMoviesTheaters(apiRepository);
  });

  group('usecase GetMoviesTheaters', () {
    test(
      'when a successfull call occurs should return [MovieTheater] entity',
      () async {
        when(apiRepository.getMoviesTheaters())
            .thenAnswer((_) async => Right(tMovieTheater));

        final result = await usecase(NoParams());

        verify(apiRepository.getMoviesTheaters());
        verifyNoMoreInteractions(apiRepository);

        expect(result, Right(tMovieTheater));
      },
    );

    test(
        'call succeeds but generates an error, it should return [ServerFailure]',
        () async {
      when(apiRepository.getMoviesTheaters())
          .thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase(NoParams());

      verify(apiRepository.getMoviesTheaters());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(ServerFailure()));
    });

    test(
        'call succeeds but generates an error, it should return [NoInternetConnection]',
        () async {
      when(apiRepository.getMoviesTheaters())
          .thenAnswer((_) async => Left(NoInternetConnection()));

      final result = await usecase(NoParams());

      verify(apiRepository.getMoviesTheaters());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(NoInternetConnection()));
    });
  });
}
