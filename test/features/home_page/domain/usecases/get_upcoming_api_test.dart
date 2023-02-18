import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/movie.dart';
import 'package:movies_api/features/home_page/domain/entities/upcoming_movie.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_popular_movies.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_upcoming_api.dart';

import 'use_cases_generator.mocks.dart';

class MockUpcomingMovie extends Mock implements UpcomingMovie {}

void main() {
  late ApiRepository apiRepository;
  late GetUpcomingApi usecase;

  final UpcomingMovie tUpcomingMovie = MockUpcomingMovie();

  setUp(() {
    apiRepository = MockApiRepository();
    usecase = GetUpcomingApi(apiRepository);
  });

  group('usecase GetUpcomingApi', () {
    test(
      'when a successfull call occurs should return [UpcomingMovie] entity',
      () async {
        when(apiRepository.getUpcomingApi())
            .thenAnswer((_) async => Right(tUpcomingMovie));

        final result = await usecase(NoParams());

        verify(apiRepository.getUpcomingApi());
        verifyNoMoreInteractions(apiRepository);

        expect(result, Right(tUpcomingMovie));
      },
    );

    test(
        'call succeeds but generates an error, it should return [ServerFailure]',
        () async {
      when(apiRepository.getUpcomingApi())
          .thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase(NoParams());

      verify(apiRepository.getUpcomingApi());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(ServerFailure()));
    });

    test(
        'call succeeds but generates an error, it should return [NoInternetConnection]',
        () async {
      when(apiRepository.getUpcomingApi())
          .thenAnswer((_) async => Left(NoInternetConnection()));

      final result = await usecase(NoParams());

      verify(apiRepository.getUpcomingApi());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(NoInternetConnection()));
    });
  });
}
