import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/data/models/config_model.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_configuration_api.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';

import '../../../data/models/models_generator.mocks.dart';
import '../../../domain/usecases/use_cases_generator.mocks.dart';

void main() {
  //mock
  MockApiRepository mockApiRepository = MockApiRepository();
  late GetConfigurationApi usecase;
  late ConfigurateApiBloc configurateApiBloc;

  //mock model
  ConfigModel tConfigModel = MockConfigModel();

  group('event ConfigurateApiLoad', () {
    setUp(() {
      usecase = GetConfigurationApi(mockApiRepository);
      configurateApiBloc = ConfigurateApiBloc(getConfigurationApi: usecase);
    });

    test('initial state is ConfigurateApiLoading', () {
      expect(configurateApiBloc.state, isA<ConfigurateApiLoading>());
      configurateApiBloc.close();
    });

    blocTest<ConfigurateApiBloc, ConfigurateApiState>(
      'when an successfull call occurs emit a [ConfigurateApiLoaded]',
      build: () {
        when(configurateApiBloc.getConfigurationApi(NoParams()))
            .thenAnswer((_) async => Right(tConfigModel));
        return configurateApiBloc;
      },
      act: (bloc) => bloc.add(ConfigurateApiLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<ConfigurateApiLoading>(), isA<ConfigurateApiLoaded>()],
    );

    blocTest<ConfigurateApiBloc, ConfigurateApiState>(
      'when an error [ServerFailure] occurs emit a [ConfigurateApiError]',
      build: () {
        when(configurateApiBloc.getConfigurationApi(NoParams()))
            .thenAnswer((_) async => Left(ServerFailure()));
        return configurateApiBloc;
      },
      act: (bloc) => bloc.add(ConfigurateApiLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<ConfigurateApiLoading>(), isA<ConfigurateApiError>()],
    );

    blocTest<ConfigurateApiBloc, ConfigurateApiState>(
      'when an error [NoInternetConnection] occurs emit a [ConfigurateApiError]',
      build: () {
        when(configurateApiBloc.getConfigurationApi(NoParams()))
            .thenAnswer((_) async => Left(NoInternetConnection()));
        return configurateApiBloc;
      },
      act: (bloc) => bloc.add(ConfigurateApiLoad()),
      wait: const Duration(seconds: 1),
      expect: () => [isA<ConfigurateApiLoading>(), isA<ConfigurateApiError>()],
    );
  });
}
