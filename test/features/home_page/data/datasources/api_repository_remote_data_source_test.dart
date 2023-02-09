import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/features/home_page/data/datasources/api_repository_remote_data_source.dart';
import 'package:movies_api/features/home_page/data/models/config_model.dart';
import 'package:movies_api/features/home_page/data/models/movie_model.dart';
import 'package:movies_api/features/home_page/data/models/movie_in_theater_model.dart';
import 'package:movies_api/features/home_page/data/models/top_rated_model.dart';
import 'package:movies_api/features/home_page/data/models/trending_model.dart';

import '../models/models_generator.mocks.dart';
import 'api_repository_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ApiRepositoryRemoteDataSourceImpl>(),
  MockSpec<ApiRepositoryRemoteDataSource>(),
])
void main() {
  group(
    'grouped getConfigurationApi',
    () {
      late MockApiRepositoryRemoteDataSourceImpl mockApiRepository;
      late MockConfigModel tConfigModel;

      setUp(() {
        mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
        tConfigModel = MockConfigModel();
      });

      test('should return ConfigModel if http call completes sucessfully',
          () async {
        when(mockApiRepository.getConfigurationApi())
            .thenAnswer((_) async => tConfigModel);

        final result = await mockApiRepository.getConfigurationApi();

        verify(mockApiRepository.getConfigurationApi());
        verifyNoMoreInteractions(mockApiRepository);

        expect(result, isA<ConfigModel>());
      });
      test('should return a ServerException if http call complete with error',
          () async {
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
  group(
    'grouped getTrendingApi',
    () {
      late MockApiRepositoryRemoteDataSourceImpl mockApiRepository;
      late MockTrendingModel trendingModel;

      setUp(() {
        mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
        trendingModel = MockTrendingModel();
      });

      test('should return TrendingModel if http call completes sucessfully',
          () async {
        when(mockApiRepository.getTrendingApi())
            .thenAnswer((_) async => Future.value(trendingModel));

        final result = await mockApiRepository.getTrendingApi();

        verify(mockApiRepository.getTrendingApi());
        verifyNoMoreInteractions(mockApiRepository);

        expect(result, isA<TrendingModel>());
      });
      test('should return a ServerException if http call complete with error',
          () async {
        when(mockApiRepository.getTrendingApi()).thenThrow(ServerException());

        expect(() => mockApiRepository.getTrendingApi(),
            throwsA(predicate((e) => e is ServerException)));

        verify(mockApiRepository.getTrendingApi());
        verifyNoMoreInteractions(mockApiRepository);
      });
    },
  );
  group(
    'grouped getTopRatedApi',
    () {
      late MockApiRepositoryRemoteDataSourceImpl mockApiRepository;
      late MockTopRatedModel tTopRatedModel;

      setUp(() {
        mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
        tTopRatedModel = MockTopRatedModel();
      });

      test('should return TopRatedModel if http call completes sucessfully',
          () async {
        when(mockApiRepository.getTopRatedApi())
            .thenAnswer((_) async => tTopRatedModel);

        final result = await mockApiRepository.getTopRatedApi();

        verify(mockApiRepository.getTopRatedApi());
        verifyNoMoreInteractions(mockApiRepository);

        expect(result, isA<TopRatedModel>());
      });
      test('should return a ServerException if http call complete with error',
          () async {
        when(mockApiRepository.getTopRatedApi()).thenThrow(ServerException());

        expect(() => mockApiRepository.getTopRatedApi(),
            throwsA(predicate((e) => e is ServerException)));

        verify(mockApiRepository.getTopRatedApi());
        verifyNoMoreInteractions(mockApiRepository);
      });
    },
  );

  group('grouped getMoviesInTheaters', () {
    late MockApiRepositoryRemoteDataSourceImpl mockApiRepository;
    late MockMovieInTheaterModel tmovieInTheaterModel;

    setUp(() {
      mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
      tmovieInTheaterModel = MockMovieInTheaterModel();
    });

    test('should return movieInTheaterModel if http call completes sucessfully',
        () async {
      when(mockApiRepository.getMoviesInTheaters())
          .thenAnswer((_) async => tmovieInTheaterModel);

      final result = await mockApiRepository.getMoviesInTheaters();

      verify(mockApiRepository.getMoviesInTheaters());
      verifyNoMoreInteractions(mockApiRepository);

      expect(result, isA<MovieInTheaterModel>());
    });
    test('should return a ServerException if http call complete with error',
        () async {
      when(mockApiRepository.getMoviesInTheaters()).thenThrow(ServerException());

      expect(() => mockApiRepository.getMoviesInTheaters(),
          throwsA(predicate((e) => e is ServerException)));

      verify(mockApiRepository.getMoviesInTheaters());
      verifyNoMoreInteractions(mockApiRepository);
    });
  });
}
