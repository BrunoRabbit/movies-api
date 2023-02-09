import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/data/models/config_model.dart';
import 'package:movies_api/features/home_page/data/models/movie_in_theater_model.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_configuration_api.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_movies_in_theaters.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/movies_theaters_bloc/movies_in_theaters_bloc.dart';

import '../../../data/models/models_generator.mocks.dart';
import '../../../domain/usecases/use_cases_generator.mocks.dart';

void main() {
  //mock
  MockApiRepository mockApiRepository = MockApiRepository();
  late GetMoviesInTheaters usecase;
  late MoviesInTheatersBloc moviesInTheatersBloc;

  //mock model
  MovieInTheaterModel tMovieInTheaterModel = MockMovieInTheaterModel();

  group('event MovieInTheaterLoad', () {
    setUp(() {
      usecase = GetMoviesInTheaters(mockApiRepository);
      moviesInTheatersBloc = MoviesInTheatersBloc(getMoviesInTheaters: usecase);
    });

    test('initial state is MoviesInTheatersLoading', () {
      expect(moviesInTheatersBloc.state, isA<MoviesInTheatersLoading>());
      moviesInTheatersBloc.close();
    });

    blocTest<MoviesInTheatersBloc, MoviesInTheatersState>(
      'when an successfull call occurs emit a [MoviesInTheatersLoaded]',
      build: () {
        when(moviesInTheatersBloc.getMoviesInTheaters(NoParams()))
            .thenAnswer((_) async => Right(tMovieInTheaterModel));
        return moviesInTheatersBloc;
      },
      act: (bloc) => bloc.add(MoviesInTheatersLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<MoviesInTheatersLoading>(), isA<MoviesInTheatersLoaded>()],
    );

    blocTest<MoviesInTheatersBloc, MoviesInTheatersState>(
      'when an error [ServerFailure] occurs emit a [MoviesInTheatersError]',
      build: () {
        when(moviesInTheatersBloc.getMoviesInTheaters(NoParams()))
            .thenAnswer((_) async => Left(ServerFailure()));
        return moviesInTheatersBloc;
      },
      act: (bloc) => bloc.add(MoviesInTheatersLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<MoviesInTheatersLoading>(), isA<MoviesInTheatersError>()],
    );

    blocTest<MoviesInTheatersBloc, MoviesInTheatersState>(
      'when an error [NoInternetConnection] occurs emit a [MoviesInTheatersError]',
      build: () {
        when(moviesInTheatersBloc.getMoviesInTheaters(NoParams()))
            .thenAnswer((_) async => Left(NoInternetConnection()));
        return moviesInTheatersBloc;
      },
      act: (bloc) => bloc.add(MoviesInTheatersLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<MoviesInTheatersLoading>(), isA<MoviesInTheatersError>()],
    );
  });
}
