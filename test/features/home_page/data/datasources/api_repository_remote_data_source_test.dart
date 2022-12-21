import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/data/models/config_model.dart';
import 'package:movies_api/features/home_page/data/models/movie_model.dart';
import 'package:movies_api/features/home_page/data/models/trending_model.dart';

import '../models/.models_generator.mocks.dart';
import 'api_repository_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiRepositoryRemoteDataSourceImpl])
void main() {
  MockApiRepositoryRemoteDataSourceImpl mockApiRepository =
      MockApiRepositoryRemoteDataSourceImpl();

  final configModel = MockConfigModel();
  final movieModel = MockMovieModel();
  final trendingModel = MockTrendingModel();

  group(
    'grouped getConfigurationApi',
    () {
      test('should return ConfigModel if http call completes sucessfully',
          () async {
        when(mockApiRepository.getConfigurationApi())
            .thenAnswer((_) => Future.value(configModel));

        expect(
            await mockApiRepository.getConfigurationApi(), isA<ConfigModel>());

        verifyAndClearInterations(mock: mockApiRepository);
      });
      test('should return a ServerException if http call complete with error',
          () async {
        when(mockApiRepository.getConfigurationApi())
            .thenAnswer((_) => throw ServerException());

        expect(() => mockApiRepository.getConfigurationApi(),
            throwsA(isA<ServerException>()));

        verifyAndClearInterations(mock: mockApiRepository);
      });
    },
  );
  group(
    'grouped getPopularMovies',
    () {
      test('should return MovieModel if http call completes sucessfully',
          () async {
        when(mockApiRepository.getPopularMovies())
            .thenAnswer((_) => Future.value(movieModel));

        expect(await mockApiRepository.getPopularMovies(), isA<MovieModel>());

        verifyAndClearInterations(mock: mockApiRepository);
      });
      test('should return a ServerException if http call complete with error',
          () async {
        when(mockApiRepository.getPopularMovies())
            .thenAnswer((_) => throw ServerException());

        expect(() => mockApiRepository.getPopularMovies(),
            throwsA(isA<ServerException>()));

        verifyAndClearInterations(mock: mockApiRepository);
      });
    },
  );
  group(
    'grouped getTrendingApi',
    () {
      test('should return TrendingModel if http call completes sucessfully',
          () async {
        when(mockApiRepository.getTrendingApi())
            .thenAnswer((_) async => Future.value(trendingModel));

        expect(await mockApiRepository.getTrendingApi(), isA<TrendingModel>());

        verifyAndClearInterations(mock: mockApiRepository);
      });
      test('should return a ServerException if http call complete with error',
          () async {
        when(mockApiRepository.getTrendingApi())
            .thenAnswer((_) => throw ServerException());

        expect(() => mockApiRepository.getTrendingApi(),
            throwsA(isA<ServerException>()));

        verifyAndClearInterations(mock: mockApiRepository);
      });
    },
  );
}

/// Making sure interaction(s) never happened on mock with [verifyZeroInteractions] and
/// finding redundant invocations with [verifyNoMoreInteractions]
dynamic verifyAndClearInterations({dynamic mock}) {
  clearInteractions(mock);
  verifyZeroInteractions(mock);
  verifyNoMoreInteractions(mock);
}
