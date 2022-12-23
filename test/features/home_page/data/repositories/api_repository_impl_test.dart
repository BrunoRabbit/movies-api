import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/config.dart';
import 'package:movies_api/features/home_page/domain/entities/movie.dart';
import 'package:movies_api/features/home_page/domain/entities/trending.dart';

import '../../../../core/network/.network_generator.mocks.dart';
import '../models/_models_generator.mocks.dart';
import '_repositories_generator.mocks.dart';

void main() {
  void checkIfDeviceHasInternet(Function body, {bool isHasInternet = true}) {
    MockNetworkStatusImpl networkStatusImpl = MockNetworkStatusImpl();

    when(networkStatusImpl.isConnected)
        .thenAnswer((_) async => isHasInternet ? true : false);

    body();
  }

  //? [getConfigurationApi] group
  group('getConfigurationApi', () {
    //? has internet
    checkIfDeviceHasInternet(isHasInternet: true, () {
      //! tests
      test('test getConfigurationApi when connected', () async {
        final repositoryImpl = MockApiRepositoryImpl();
        Config tConfig = MockConfigModel();

        when(repositoryImpl.getConfigurationApi())
            .thenAnswer((_) async => Right(tConfig));

        final result = await repositoryImpl.getConfigurationApi();

        verify(repositoryImpl.getConfigurationApi()).called(1);
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Right(tConfig));
      });
      test('call getConfigurationApi and give error', () async {
        final repositoryImpl = MockApiRepositoryImpl();

        when(repositoryImpl.getConfigurationApi())
            .thenAnswer((_) async => Left(ServerFailure()));

        final result = await repositoryImpl.getConfigurationApi();

        verify(repositoryImpl.getConfigurationApi());
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(ServerFailure()));
      });
    });
    //? don't have internet
    checkIfDeviceHasInternet(isHasInternet: false, () {
      //! tests
      test('call getConfigurationApi when don\'t have internet', () async {
        final repositoryImpl = MockApiRepositoryImpl();

        when(repositoryImpl.getConfigurationApi())
            .thenAnswer((_) async => Left(NoInternetConnection()));

        final result = await repositoryImpl.getConfigurationApi();

        verify(repositoryImpl.getConfigurationApi());
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(NoInternetConnection()));
      });
    });
  });
  //? [getPopularMovies] group
  group('getPopularMovies', () {
    //? has internet
    checkIfDeviceHasInternet(isHasInternet: true, () {
      //! tests
      test('test getPopularMovies when connected', () async {
        final repositoryImpl = MockApiRepositoryImpl();
        Movie tMovies = MockMovieModel();

        when(repositoryImpl.getPopularMovies())
            .thenAnswer((_) async => Right(tMovies));

        final result = await repositoryImpl.getPopularMovies();

        verify(repositoryImpl.getPopularMovies()).called(1);
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Right(tMovies));
      });
      test('call getPopularMovies and give error', () async {
        final repositoryImpl = MockApiRepositoryImpl();

        when(repositoryImpl.getPopularMovies())
            .thenAnswer((_) async => Left(ServerFailure()));

        final result = await repositoryImpl.getPopularMovies();

        verify(repositoryImpl.getPopularMovies());
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(ServerFailure()));
      });
    });
    //? don't have internet
    checkIfDeviceHasInternet(isHasInternet: false, () {
      //! tests
      test('call getPopularMovies when don\'t have internet', () async {
        final repositoryImpl = MockApiRepositoryImpl();

        when(repositoryImpl.getPopularMovies())
            .thenAnswer((_) async => Left(NoInternetConnection()));

        final result = await repositoryImpl.getPopularMovies();

        verify(repositoryImpl.getPopularMovies());
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(NoInternetConnection()));
      });
    });
  });
  //? [getTrendingApi] group
  group('getTrendingApi', () {
    //? has internet
    checkIfDeviceHasInternet(isHasInternet: true, () {
      //! tests
      test('test getTrendingApi when connected', () async {
        final repositoryImpl = MockApiRepositoryImpl();
        Trending tTrending = MockTrendingModel();

        when(repositoryImpl.getTrendingApi())
            .thenAnswer((_) async => Right(tTrending));

        final result = await repositoryImpl.getTrendingApi();

        verify(repositoryImpl.getTrendingApi()).called(1);
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Right(tTrending));
      });
      test('call getTrendingApi and give error', () async {
        final repositoryImpl = MockApiRepositoryImpl();

        when(repositoryImpl.getTrendingApi())
            .thenAnswer((_) async => Left(ServerFailure()));

        final result = await repositoryImpl.getTrendingApi();

        verify(repositoryImpl.getTrendingApi());
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(ServerFailure()));
      });
    });
    //? don't have internet
    checkIfDeviceHasInternet(isHasInternet: false, () {
      //! tests
      test('call getTrendingApi when don\'t have internet', () async {
        final repositoryImpl = MockApiRepositoryImpl();

        when(repositoryImpl.getTrendingApi())
            .thenAnswer((_) async => Left(NoInternetConnection()));

        final result = await repositoryImpl.getTrendingApi();

        verify(repositoryImpl.getTrendingApi());
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(NoInternetConnection()));
      });
    });
  });
}
