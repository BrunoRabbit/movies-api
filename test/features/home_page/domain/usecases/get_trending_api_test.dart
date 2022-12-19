library get_trending_api_test;

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/trending.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_trending_api.dart';

import 'use_cases_test.mocks.dart';

void main() {
  MockApiRepository mockApiRepository = MockApiRepository();
  GetTrendingApi usecase = GetTrendingApi(mockApiRepository);

  const int? _kPage = 1;
  const List<TrendingsDetails>? _kResults = <TrendingsDetails>[];
  const int? _kTotalPages = 1;
  const int? _kTotalResults = 1;

  const tTrending = Trending(
    page: _kPage,
    results: _kResults,
    totalPages: _kTotalPages,
    totalResults: _kTotalResults,
  );

  test(
    'Should return true if getTrendingApi is called',
    () async {
      when(mockApiRepository.getTrendingApi())
          .thenAnswer((_) async => const Right(tTrending));
      final result = await usecase(NoParams());

      expect(result, const Right(tTrending));

      verify(mockApiRepository.getTrendingApi());

      verifyNoMoreInteractions(mockApiRepository);
    },
  );
}
