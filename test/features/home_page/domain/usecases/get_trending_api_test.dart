import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/trending.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_trending_api.dart';

import 'use_cases_generator.mocks.dart';

class MockTrending extends Mock implements Trending {}

void main() {
  late ApiRepository apiRepository;
  late GetTrendingApi usecase;

  final Trending tTrending = MockTrending();

  setUp(() {
    apiRepository = MockApiRepository();
    usecase = GetTrendingApi(apiRepository);
  });

  group('usecase GetTrendingApi', () {
    test(
      'when a successfull call occurs should return [Trending] entity',
      () async {
        when(apiRepository.getTrendingApi())
            .thenAnswer((_) async => Right(tTrending));

        final result = await usecase(NoParams());

        verify(apiRepository.getTrendingApi());
        verifyNoMoreInteractions(apiRepository);

        expect(result, Right(tTrending));
      },
    );

    test(
        'call succeeds but generates an error, it should return [ServerFailure]',
        () async {
      when(apiRepository.getTrendingApi())
          .thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase(NoParams());

      verify(apiRepository.getTrendingApi());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(ServerFailure()));
    });

    test(
        'call succeeds but generates an error, it should return [NoInternetConnection]',
        () async {
      when(apiRepository.getTrendingApi())
          .thenAnswer((_) async => Left(NoInternetConnection()));

      final result = await usecase(NoParams());

      verify(apiRepository.getTrendingApi());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(NoInternetConnection()));
    });
  });
}
