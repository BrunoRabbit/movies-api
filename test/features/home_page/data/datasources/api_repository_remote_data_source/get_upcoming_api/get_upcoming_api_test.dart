import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/features/home_page/data/models/upcoming_movie_model.dart';

import '../../../models/models_generator.mocks.dart';
import '../api_repository_remote_data_source_test.mocks.dart';

void main() {
  group(
    'grouped getUpcomingApi',
    () {
      late MockApiRepositoryRemoteDataSourceImpl mockApiRepository;
      late MockUpcomingMovieModel upcomingModel;

      setUp(() {
        mockApiRepository = MockApiRepositoryRemoteDataSourceImpl();
        upcomingModel = MockUpcomingMovieModel();
      });

      test('should return UpcomingMovieModel if http call completes sucessfully',
          () async {
        when(mockApiRepository.getUpcomingApi())
            .thenAnswer((_) async => Future.value(upcomingModel));

        final result = await mockApiRepository.getUpcomingApi();

        verify(mockApiRepository.getUpcomingApi());
        verifyNoMoreInteractions(mockApiRepository);

        expect(result, isA<UpcomingMovieModel>());
      });
      test('should return a ServerException if http call complete with error',
          () async {
        when(mockApiRepository.getUpcomingApi()).thenThrow(ServerException());

        expect(() => mockApiRepository.getUpcomingApi(),
            throwsA(predicate((e) => e is ServerException)));

        verify(mockApiRepository.getUpcomingApi());
        verifyNoMoreInteractions(mockApiRepository);
      });
    },
  );
}
