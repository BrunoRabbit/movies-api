// ignore_for_file: must_be_immutable

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/config.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_configuration_api.dart';

import 'use_cases_generator.mocks.dart';

class MockConfig extends Mock implements Config {}

void main() {
  late ApiRepository apiRepository;
  late GetConfigurationApi usecase;

  final Config tConfig = MockConfig();

  setUp(() {
    apiRepository = MockApiRepository();
    usecase = GetConfigurationApi(apiRepository);
  });

  group('usecase GetConfigurationApi', () {
    test(
      'when a successfull call occurs should return [Config] entity',
      () async {
        when(apiRepository.getConfigurationApi())
            .thenAnswer((_) async => Right(tConfig));

        final result = await usecase(NoParams());

        verify(apiRepository.getConfigurationApi());
        verifyNoMoreInteractions(apiRepository);

        expect(result, Right(tConfig));
      },
    );

    test(
        'call succeeds but generates an error, it should return [ServerFailure]',
        () async {
      when(apiRepository.getConfigurationApi())
          .thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase(NoParams());

      verify(apiRepository.getConfigurationApi());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(ServerFailure()));
    });

    test(
        'call succeeds but generates an error, it should return [NoInternetConnection]',
        () async {
      when(apiRepository.getConfigurationApi())
          .thenAnswer((_) async => Left(NoInternetConnection()));

      final result = await usecase(NoParams());

      verify(apiRepository.getConfigurationApi());
      verifyNoMoreInteractions(apiRepository);

      expect(result, Left(NoInternetConnection()));
    });
  });
}
