import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/data/models/movie_model.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_popular_movies.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';

import '../../../data/models/models_generator.mocks.dart';
import '../../../domain/usecases/use_cases_generator.mocks.dart';

void main() {
  //mock
  MockApiRepository mockApiRepository = MockApiRepository();
  late GetPopularMovies usecase;
  late PopularApiBloc popularApiBloc;

  //mock model
  MovieModel tMovieModel = MockMovieModel();

  group('event PopularApiLoad', () {
    setUp(() {
      usecase = GetPopularMovies(mockApiRepository);
      popularApiBloc = PopularApiBloc(getPopularMovies: usecase);
    });

    test('initial state is PopularApiLoading', () {
      expect(popularApiBloc.state, isA<PopularApiLoading>());
      popularApiBloc.close();
    });

    blocTest<PopularApiBloc, PopularApiState>(
      'when an successfull call occurs emit a [PopularApiLoaded]',
      build: () {
        when(popularApiBloc.getPopularMovies(NoParams()))
            .thenAnswer((_) async => Right(tMovieModel));
        return popularApiBloc;
      },
      act: (bloc) => bloc.add(PopularApiLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<PopularApiLoading>(), isA<PopularApiLoaded>()],
    );

    blocTest<PopularApiBloc, PopularApiState>(
      'when an error [ServerFailure] occurs emit a [PopularApiError]',
      build: () {
        when(popularApiBloc.getPopularMovies(NoParams()))
            .thenAnswer((_) async => Left(ServerFailure()));
        return popularApiBloc;
      },
      act: (bloc) => bloc.add(PopularApiLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<PopularApiLoading>(), isA<PopularApiError>()],
    );

    blocTest<PopularApiBloc, PopularApiState>(
      'when an error [NoInternetConnection] occurs emit a [PopularApiError]',
      build: () {
        when(popularApiBloc.getPopularMovies(NoParams()))
            .thenAnswer((_) async => Left(NoInternetConnection()));
        return popularApiBloc;
      },
      act: (bloc) => bloc.add(PopularApiLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<PopularApiLoading>(), isA<PopularApiError>()],
    );
  });
}
