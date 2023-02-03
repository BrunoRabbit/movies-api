import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/error/failure.dart';
import 'package:movies_api/core/utils/use_case.dart';
import 'package:movies_api/features/home_page/data/models/top_rated_model.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_top_rated.dart';
import 'package:movies_api/features/home_page/presentation/bloc/top_rated_bloc/top_rated_bloc.dart';

import '../../../data/models/models_generator.mocks.dart';
import '../../../domain/usecases/use_cases_generator.mocks.dart';

void main() {
  // * Mock
  MockApiRepository mockRepository = MockApiRepository();
  late GetTopRated usecase;
  late TopRatedBloc topRatedBloc;

  // * Mock Model
  TopRatedModel tTopRatedModel = MockTopRatedModel();

  group('event TopRatedBloc', () {
    setUp(() {
      usecase = GetTopRated(mockRepository);
      topRatedBloc = TopRatedBloc(getTopRated: usecase);
    });

    test('initial state is TopRatedLoading', () {
      expect(topRatedBloc.state, isA<TopRatedLoading>());
      topRatedBloc.close();
    });

    blocTest<TopRatedBloc, TopRatedState>(
      'when an successfull call occurs emit a [TopRatedLoaded]',
      build: () {
        when(topRatedBloc.getTopRated(NoParams()))
            .thenAnswer((_) async => Right(tTopRatedModel));
        return topRatedBloc;
      },
      act: (bloc) => bloc.add(TopRatedLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<TopRatedLoading>(), isA<TopRatedLoaded>()],
    );

    blocTest<TopRatedBloc, TopRatedState>(
      'when an error [ServerFailure] occurs emit a [TopRatedError]',
      build: () {
        when(topRatedBloc.getTopRated(NoParams()))
            .thenAnswer((_) async => Left(ServerFailure()));
        return topRatedBloc;
      },
      act: (bloc) => bloc.add(TopRatedLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<TopRatedLoading>(), isA<TopRatedError>()],
    );

    blocTest<TopRatedBloc, TopRatedState>(
      'when an error [NoInternetConnection] occurs emit a [TopRatedError]',
      build: () {
        when(topRatedBloc.getTopRated(NoParams()))
            .thenAnswer((_) async => Left(NoInternetConnection()));
        return topRatedBloc;
      },
      act: (bloc) => bloc.add(TopRatedLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<TopRatedLoading>(), isA<TopRatedError>()],
    );
  });
}