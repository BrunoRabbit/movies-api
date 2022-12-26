import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/data/models/trending_model.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_trending_api.dart';
import 'package:movies_api/features/home_page/presentation/bloc/trending_api_bloc/trending_api_bloc.dart';

import '../../../data/models/_models_generator.mocks.dart';
import '../../../domain/usecases/_use_cases_generator.mocks.dart';

void main() {
  //mock
  MockApiRepository mockApiRepository = MockApiRepository();
  late GetTrendingApi usecase;
  late TrendingApiBloc trendingApiBloc;

  //mock model
  TrendingModel tTrendingModel = MockTrendingModel();

  group('event TrendingApiLoad', () {
    setUp(() {
      usecase = GetTrendingApi(mockApiRepository);
      trendingApiBloc = TrendingApiBloc(getTrendingApi: usecase);
    });

    test('initial state is TrendingApiLoading', () {
      expect(trendingApiBloc.state, isA<TrendingApiLoading>());
      trendingApiBloc.close();
    });

    blocTest<TrendingApiBloc, TrendingApiState>(
      'when an successfull call occurs emit a [TrendingApiLoaded]',
      build: () {
        when(trendingApiBloc.getTrendingApi(NoParams()))
            .thenAnswer((_) async => Right(tTrendingModel));
        return trendingApiBloc;
      },
      act: (bloc) => bloc.add(TrendingApiLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<TrendingApiLoading>(), isA<TrendingApiLoaded>()],
    );

    blocTest<TrendingApiBloc, TrendingApiState>(
      'when an error [ServerFailure] occurs emit a [TrendingApiError]',
      build: () {
        when(trendingApiBloc.getTrendingApi(NoParams()))
            .thenAnswer((_) async => Left(ServerFailure()));
        return trendingApiBloc;
      },
      act: (bloc) => bloc.add(TrendingApiLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<TrendingApiLoading>(), isA<TrendingApiError>()],
    );

    blocTest<TrendingApiBloc, TrendingApiState>(
      'when an error [NoInternetConnection] occurs emit a [TrendingApiError]',
      build: () {
        when(trendingApiBloc.getTrendingApi(NoParams()))
            .thenAnswer((_) async => Left(NoInternetConnection()));
        return trendingApiBloc;
      },
      act: (bloc) => bloc.add(TrendingApiLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<TrendingApiLoading>(), isA<TrendingApiError>()],
    );
  });
}
