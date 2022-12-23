import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/config.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_configuration_api.dart';

import '_use_cases_generator.mocks.dart';

void main() {
  MockApiRepository mockApiRepository = MockApiRepository();
  GetConfigurationApi usecase = GetConfigurationApi(mockApiRepository);

  Images? tImages;
  List<String>? tListKeys;

  final tConfig = Config(changeKeys: tListKeys, images: tImages);

  test(
    'Should return true if getConfigurationApi is called',
    () async {
      when(mockApiRepository.getConfigurationApi())
          .thenAnswer((_) async => Right(tConfig));
      final result = await usecase(NoParams());

      expect(result, Right(tConfig));

      verify(mockApiRepository.getConfigurationApi());

      verifyNoMoreInteractions(mockApiRepository);
    },
  );
}
