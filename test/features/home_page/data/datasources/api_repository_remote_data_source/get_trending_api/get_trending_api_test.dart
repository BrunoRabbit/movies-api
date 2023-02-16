import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/features/home_page/data/models/trending_model.dart';

import '../../../models/models_generator.mocks.dart';
import '../api_repository_remote_data_source_test.mocks.dart';

void main() {
  group(
    'grouped getTrendingApi',
    () {
      late MockApiRepositoryRemoteDataSourceImpl mockApiRepository;
      late MockTrendingModel trendingModel;

      setUp(() {
        mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
        trendingModel = MockTrendingModel();
      });

      test('should return TrendingModel if http call completes sucessfully',
          () async {
        when(mockApiRepository.getTrendingApi())
            .thenAnswer((_) async => Future.value(trendingModel));

        final result = await mockApiRepository.getTrendingApi();

        verify(mockApiRepository.getTrendingApi());
        verifyNoMoreInteractions(mockApiRepository);

        expect(result, isA<TrendingModel>());
      });
      test('should return a ServerException if http call complete with error',
          () async {
        when(mockApiRepository.getTrendingApi()).thenThrow(ServerException());

        expect(() => mockApiRepository.getTrendingApi(),
            throwsA(predicate((e) => e is ServerException)));

        verify(mockApiRepository.getTrendingApi());
        verifyNoMoreInteractions(mockApiRepository);
      });
    },
  );
}
