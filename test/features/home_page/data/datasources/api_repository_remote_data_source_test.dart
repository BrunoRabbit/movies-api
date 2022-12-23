import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/features/home_page/data/models/config_model.dart';
import 'package:movies_api/features/home_page/data/models/movie_model.dart';
import 'package:movies_api/features/home_page/data/models/trending_model.dart';

import '../models/_models_generator.mocks.dart';
import '_data_source_generator.mocks.dart';

void main() {
  group(
    'grouped getConfigurationApi',
    () {
      test('should return ConfigModel if http call completes sucessfully',
          () async {
        final mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
        final tConfigModel = MockConfigModel();

        when(mockApiRepository.getConfigurationApi())
            .thenAnswer((_) async => tConfigModel);

        final result = await mockApiRepository.getConfigurationApi();

        verify(mockApiRepository.getConfigurationApi());
        verifyNoMoreInteractions(mockApiRepository);

        expect(result, isA<ConfigModel>());
      });
      test('should return a ServerException if http call complete with error',
          () async {
        final mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();

        when(mockApiRepository.getConfigurationApi())
            .thenThrow(ServerException());

        expect(() => mockApiRepository.getConfigurationApi(),
            throwsA(predicate((e) => e is ServerException)));

        verify(mockApiRepository.getConfigurationApi());
        verifyNoMoreInteractions(mockApiRepository);
      });
    },
  );
  group(
    'grouped getPopularMovies',
    () {
      test('should return MovieModel if http call completes sucessfully',
          () async {
        final mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
        final movieModel = MockMovieModel();

        when(mockApiRepository.getPopularMovies())
            .thenAnswer((_) => Future.value(movieModel));

        final result = await mockApiRepository.getPopularMovies();

        verify(mockApiRepository.getPopularMovies());
        verifyNoMoreInteractions(mockApiRepository);

        expect(result, isA<MovieModel>());
      });
      test('should return a ServerException if http call complete with error',
          () async {
        final mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();

        when(mockApiRepository.getPopularMovies()).thenThrow(ServerException());

        expect(() => mockApiRepository.getPopularMovies(),
            throwsA(predicate((e) => e is ServerException)));

        verify(mockApiRepository.getPopularMovies());
        verifyNoMoreInteractions(mockApiRepository);
      });
    },
  );
  group(
    'grouped getTrendingApi',
    () {
      test('should return TrendingModel if http call completes sucessfully',
          () async {
        final mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
        final trendingModel = MockTrendingModel();

        when(mockApiRepository.getTrendingApi())
            .thenAnswer((_) async => Future.value(trendingModel));

        final result = await mockApiRepository.getTrendingApi();

        verify(mockApiRepository.getTrendingApi());
        verifyNoMoreInteractions(mockApiRepository);

        expect(result, isA<TrendingModel>());
      });
      test('should return a ServerException if http call complete with error',
          () async {
        final mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();

        when(mockApiRepository.getTrendingApi()).thenThrow(ServerException());

        expect(() => mockApiRepository.getTrendingApi(),
            throwsA(predicate((e) => e is ServerException)));

        verify(mockApiRepository.getTrendingApi());
        verifyNoMoreInteractions(mockApiRepository);
      });
    },
  );
}
