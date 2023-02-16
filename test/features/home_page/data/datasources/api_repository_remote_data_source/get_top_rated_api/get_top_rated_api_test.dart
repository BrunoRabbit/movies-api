import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/features/home_page/data/models/top_rated_model.dart';

import '../../../models/models_generator.mocks.dart';
import '../api_repository_remote_data_source_test.mocks.dart';

void main() {
  group(
    'grouped getTopRatedApi',
    () {
      late MockApiRepositoryRemoteDataSourceImpl mockApiRepository;
      late MockTopRatedModel tTopRatedModel;

      setUp(() {
        mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
        tTopRatedModel = MockTopRatedModel();
      });

      test('should return TopRatedModel if http call completes sucessfully',
          () async {
        when(mockApiRepository.getTopRatedApi())
            .thenAnswer((_) async => tTopRatedModel);

        final result = await mockApiRepository.getTopRatedApi();

        verify(mockApiRepository.getTopRatedApi());
        verifyNoMoreInteractions(mockApiRepository);

        expect(result, isA<TopRatedModel>());
      });
      test('should return a ServerException if http call complete with error',
          () async {
        when(mockApiRepository.getTopRatedApi()).thenThrow(ServerException());

        expect(() => mockApiRepository.getTopRatedApi(),
            throwsA(predicate((e) => e is ServerException)));

        verify(mockApiRepository.getTopRatedApi());
        verifyNoMoreInteractions(mockApiRepository);
      });
    },
  );
}
