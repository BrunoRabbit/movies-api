import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/data/models/upcoming_movie_model.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_upcoming_api.dart';
import 'package:movies_api/features/home_page/presentation/bloc/upcoming_api_bloc/upcoming_api_bloc.dart';

import '../../../data/models/models_generator.mocks.dart';
import '../../../domain/usecases/use_cases_generator.mocks.dart';

void main() {
  //mock
  MockApiRepository mockApiRepository = MockApiRepository();
  late GetUpcomingApi usecase;
  late UpcomingApiBloc upcomingApiBloc;

  //mock model
  UpcomingMovieModel tUpcomingMovieModel = MockUpcomingMovieModel();

  group('event UpcomingApiLoad', () {
    setUp(() {
      usecase = GetUpcomingApi(mockApiRepository);
      upcomingApiBloc = UpcomingApiBloc(getUpcomingApi: usecase);
    });

    test('initial state is UpcomingApiLoading', () {
      expect(upcomingApiBloc.state, isA<UpcomingApiLoading>());
      upcomingApiBloc.close();
    });

    blocTest<UpcomingApiBloc, UpcomingApiState>(
      'when an successfull call occurs emit a [UpcomingApiLoaded]',
      build: () {
        when(upcomingApiBloc.getUpcomingApi(NoParams()))
            .thenAnswer((_) async => Right(tUpcomingMovieModel));
        return upcomingApiBloc;
      },
      act: (bloc) => bloc.add(UpcomingApiLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<UpcomingApiLoading>(), isA<UpcomingApiLoaded>()],
    );

    blocTest<UpcomingApiBloc, UpcomingApiState>(
      'when an error [ServerFailure] occurs emit a [UpcomingApiError]',
      build: () {
        when(upcomingApiBloc.getUpcomingApi(NoParams()))
            .thenAnswer((_) async => Left(ServerFailure()));
        return upcomingApiBloc;
      },
      act: (bloc) => bloc.add(UpcomingApiLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<UpcomingApiLoading>(), isA<UpcomingApiError>()],
    );

    blocTest<UpcomingApiBloc, UpcomingApiState>(
      'when an error [NoInternetConnection] occurs emit a [UpcomingApiError]',
      build: () {
        when(upcomingApiBloc.getUpcomingApi(NoParams()))
            .thenAnswer((_) async => Left(NoInternetConnection()));
        return upcomingApiBloc;
      },
      act: (bloc) => bloc.add(UpcomingApiLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<UpcomingApiLoading>(), isA<UpcomingApiError>()],
    );
  });
}
