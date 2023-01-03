import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/error/failure.dart';
import 'package:movies_api/core/utils/use_case.dart';
import 'package:movies_api/features/home_page/domain/entities/top_rated.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_top_rated.dart';

import 'use_cases_generator.mocks.dart';

class MockTopRated extends Mock implements TopRated {}

void main() {
  late ApiRepository apiRepository;
  late GetTopRated usecase;

  final TopRated tTopRated = MockTopRated();

  setUp(() {
    apiRepository = MockApiRepository();
    usecase = GetTopRated(apiRepository);
  });

  group('usecase GetTopRated', () {
    test(
      'when a successfull call occurs should return [TopRated] entity',
      () async {
        when(apiRepository.getTopRated())
            .thenAnswer((_) async => Right(tTopRated));

        final result = await usecase(NoParams());

        verify(apiRepository.getTopRated());
        verifyNoMoreInteractions(apiRepository);

        expect(result, Right(tTopRated));
      },
    );

    test(
        'call succeeds but generates an error, it should return [ServerFailure]',
        () async {
      when(apiRepository.getTopRated())
          .thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase(NoParams());

      verify(apiRepository.getTopRated());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(ServerFailure()));
    });

    test(
        'call succeeds but generates an error, it should return [NoInternetConnection]',
        () async {
      when(apiRepository.getTopRated())
          .thenAnswer((_) async => Left(NoInternetConnection()));

      final result = await usecase(NoParams());

      verify(apiRepository.getTopRated());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(NoInternetConnection()));
    });
  });
}
