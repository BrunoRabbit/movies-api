import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/features/home_page/data/models/config_model.dart';

import '../../../models/models_generator.mocks.dart';
import '../api_repository_remote_data_source_test.mocks.dart';

void main(){
  group(
    'grouped getConfigurationApi',
    () {
      late MockApiRepositoryRemoteDataSourceImpl mockApiRepository;
      late MockConfigModel tConfigModel;

      setUp(() {
        mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
        tConfigModel = MockConfigModel();
      });

      test('should return ConfigModel if http call completes sucessfully',
          () async {
        when(mockApiRepository.getConfigurationApi())
            .thenAnswer((_) async => tConfigModel);

        final result = await mockApiRepository.getConfigurationApi();

        verify(mockApiRepository.getConfigurationApi());
        verifyNoMoreInteractions(mockApiRepository);

        expect(result, isA<ConfigModel>());
      });
      test('should return a ServerException if http call complete with error',
          () async {
        when(mockApiRepository.getConfigurationApi())
            .thenThrow(ServerException());

        expect(() => mockApiRepository.getConfigurationApi(),
            throwsA(predicate((e) => e is ServerException)));

        verify(mockApiRepository.getConfigurationApi());
        verifyNoMoreInteractions(mockApiRepository);
      });
    },
  );
}