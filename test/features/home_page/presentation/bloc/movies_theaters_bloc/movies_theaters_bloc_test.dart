import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/data/models/config_model.dart';
import 'package:movies_api/features/home_page/data/models/movie_theater_model.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_configuration_api.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_movies_theaters.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/movies_theaters_bloc/movies_theaters_bloc.dart';

import '../../../data/models/models_generator.mocks.dart';
import '../../../domain/usecases/use_cases_generator.mocks.dart';

void main() {
  //mock
  MockApiRepository mockApiRepository = MockApiRepository();
  late GetMoviesTheaters usecase;
  late MoviesTheatersBloc moviesTheatersBloc;

  //mock model
  MovieTheaterModel tMovieTheaterModel = MockMovieTheaterModel();

  group('event MovieTheaterLoad', () {
    setUp(() {
      usecase = GetMoviesTheaters(mockApiRepository);
      moviesTheatersBloc = MoviesTheatersBloc(getMoviesTheaters: usecase);
    });

    test('initial state is MoviesTheatersLoading', () {
      expect(moviesTheatersBloc.state, isA<MoviesTheatersLoading>());
      moviesTheatersBloc.close();
    });

    blocTest<MoviesTheatersBloc, MoviesTheatersState>(
      'when an successfull call occurs emit a [MoviesTheatersLoaded]',
      build: () {
        when(moviesTheatersBloc.getMoviesTheaters(NoParams()))
            .thenAnswer((_) async => Right(tMovieTheaterModel));
        return moviesTheatersBloc;
      },
      act: (bloc) => bloc.add(MoviesTheatersLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<MoviesTheatersLoading>(), isA<MoviesTheatersLoaded>()],
    );

    blocTest<MoviesTheatersBloc, MoviesTheatersState>(
      'when an error [ServerFailure] occurs emit a [MoviesTheatersError]',
      build: () {
        when(moviesTheatersBloc.getMoviesTheaters(NoParams()))
            .thenAnswer((_) async => Left(ServerFailure()));
        return moviesTheatersBloc;
      },
      act: (bloc) => bloc.add(MoviesTheatersLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<MoviesTheatersLoading>(), isA<MoviesTheatersError>()],
    );

    blocTest<MoviesTheatersBloc, MoviesTheatersState>(
      'when an error [NoInternetConnection] occurs emit a [MoviesTheatersError]',
      build: () {
        when(moviesTheatersBloc.getMoviesTheaters(NoParams()))
            .thenAnswer((_) async => Left(NoInternetConnection()));
        return moviesTheatersBloc;
      },
      act: (bloc) => bloc.add(MoviesTheatersLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<MoviesTheatersLoading>(), isA<MoviesTheatersError>()],
    );
  });
}
