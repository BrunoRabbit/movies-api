import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/data/models/upcoming_movie_model.dart';
import 'package:movies_api/features/home_page/data/repositories/api_repository_impl.dart';
import 'package:movies_api/features/home_page/domain/entities/config.dart';
import 'package:movies_api/features/home_page/domain/entities/movie.dart';
import 'package:movies_api/features/home_page/domain/entities/movie_in_theater.dart';
import 'package:movies_api/features/home_page/domain/entities/top_rated.dart';
import 'package:movies_api/features/home_page/domain/entities/trending.dart';

import '../../../../core/network/network_status_test.mocks.dart';
import '../models/models_generator.mocks.dart';
import 'api_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ApiRepositoryImpl>(),
])
void main() {
  void checkIfDeviceHasInternet(Function body, {bool isHasInternet = true}) async {
    MockNetworkStatus networkStatusImpl = MockNetworkStatus();

    when(await networkStatusImpl.isConnected)
        .thenAnswer((_) => isHasInternet ? true : false);

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

  //? [getTopRated] group
  group('getTopRated', () {
    //? has internet
    checkIfDeviceHasInternet(isHasInternet: true, () {
      //! tests
      test('test getTopRated when connected', () async {
        final repositoryImpl = MockApiRepositoryImpl();
        TopRated tTopRated = MockTopRatedModel();

        when(repositoryImpl.getTopRated())
            .thenAnswer((_) async => Right(tTopRated));

        final result = await repositoryImpl.getTopRated();

        verify(repositoryImpl.getTopRated()).called(1);
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Right(tTopRated));
      });
      test('call getTopRated and give error', () async {
        final repositoryImpl = MockApiRepositoryImpl();

        when(repositoryImpl.getTopRated())
            .thenAnswer((_) async => Left(ServerFailure()));

        final result = await repositoryImpl.getTopRated();

        verify(repositoryImpl.getTopRated());
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(ServerFailure()));
      });
    });
    //? don't have internet
    checkIfDeviceHasInternet(isHasInternet: false, () {
      //! tests
      test('call getTopRated when don\'t have internet', () async {
        final repositoryImpl = MockApiRepositoryImpl();

        when(repositoryImpl.getTopRated())
            .thenAnswer((_) async => Left(NoInternetConnection()));

        final result = await repositoryImpl.getTopRated();

        verify(repositoryImpl.getTopRated());
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(NoInternetConnection()));
      });
    });
  });

  //? [getMoviesInTheaters] group
  group('getMoviesInTheaters', () {
    //? has internet
    checkIfDeviceHasInternet(isHasInternet: true, () {
      //! tests
      test('test getMoviesInTheaters when connected', () async {
        final repositoryImpl = MockApiRepositoryImpl();
        MovieInTheater tmovieInTheater = MockMovieInTheaterModel();

        when(repositoryImpl.getMoviesInTheaters())
            .thenAnswer((_) async => Right(tmovieInTheater));

        final result = await repositoryImpl.getMoviesInTheaters();

        verify(repositoryImpl.getMoviesInTheaters()).called(1);
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Right(tmovieInTheater));
      });
      test('call getMoviesInTheaters and give error', () async {
        final repositoryImpl = MockApiRepositoryImpl();

        when(repositoryImpl.getMoviesInTheaters())
            .thenAnswer((_) async => Left(ServerFailure()));

        final result = await repositoryImpl.getMoviesInTheaters();

        verify(repositoryImpl.getMoviesInTheaters());
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(ServerFailure()));
      });
    });
    //? don't have internet
    checkIfDeviceHasInternet(isHasInternet: false, () {
      //! tests
      test('call getMoviesInTheaters when don\'t have internet', () async {
        final repositoryImpl = MockApiRepositoryImpl();

        when(repositoryImpl.getMoviesInTheaters())
            .thenAnswer((_) async => Left(NoInternetConnection()));

        final result = await repositoryImpl.getMoviesInTheaters();

        verify(repositoryImpl.getMoviesInTheaters());
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(NoInternetConnection()));
      });
    });
  });

  //? [getUpcomingApi] group
  group('getUpcomingApi', () {
    //? has internet
    checkIfDeviceHasInternet(isHasInternet: true, () {
      //! tests
      test('test getUpcomingApi when connected', () async {
        final repositoryImpl = MockApiRepositoryImpl();
        UpcomingMovieModel tUpcomingMovieModel = MockUpcomingMovieModel();

        when(repositoryImpl.getUpcomingApi())
            .thenAnswer((_) async => Right(tUpcomingMovieModel));

        final result = await repositoryImpl.getUpcomingApi();

        verify(repositoryImpl.getUpcomingApi()).called(1);
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Right(tUpcomingMovieModel));
      });
      test('call getUpcomingApi and give error', () async {
        final repositoryImpl = MockApiRepositoryImpl();

        when(repositoryImpl.getUpcomingApi())
            .thenAnswer((_) async => Left(ServerFailure()));

        final result = await repositoryImpl.getUpcomingApi();

        verify(repositoryImpl.getUpcomingApi());
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(ServerFailure()));
      });
    });
    //? don't have internet
    checkIfDeviceHasInternet(isHasInternet: false, () {
      //! tests
      test('call getUpcomingApi when don\'t have internet', () async {
        final repositoryImpl = MockApiRepositoryImpl();

        when(repositoryImpl.getUpcomingApi())
            .thenAnswer((_) async => Left(NoInternetConnection()));

        final result = await repositoryImpl.getUpcomingApi();

        verify(repositoryImpl.getUpcomingApi());
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(NoInternetConnection()));
      });
    });
  });
}
