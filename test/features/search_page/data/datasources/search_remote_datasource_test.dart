import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/features/search_page/data/datasources/search_remote_datasources.dart';
import 'package:movies_api/features/search_page/data/models/search_result_model.dart';

import '../models/search_model_test_generate.mocks.dart';
import 'search_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SearchRemoteDatasources>(),
  MockSpec<SearchRemoteDatasourcesImpl>(),
])
void main() {
  group(
    'grouped getSearchQuery',
    () {
      late MockSearchRemoteDatasourcesImpl mockApiRepository;
      late MockSearchResultModel tSearchResultModel;
      late String name;

      setUp(() {
        mockApiRepository = MockSearchRemoteDatasourcesImpl();
        tSearchResultModel = MockSearchResultModel();
        name = "Jorje";
      });

      test(
          'should return a SearchResultModel if http call completes sucessfully',
          () async {
        when(mockApiRepository.getSearchQuery(name))
            .thenAnswer((_) async => tSearchResultModel);

        final result = await mockApiRepository.getSearchQuery(name);

        verify(mockApiRepository.getSearchQuery(name));
        verifyNoMoreInteractions(mockApiRepository);

        expect(result, isA<SearchResultModel>());
      });

      test('should return a ServerException if http call complete with error',
          () async {
        when(mockApiRepository.getSearchQuery(name))
            .thenThrow(ServerException());

        expect(() => mockApiRepository.getSearchQuery(name),
            throwsA(predicate((e) => e is ServerException)));

        verify(mockApiRepository.getSearchQuery(name));
        verifyNoMoreInteractions(mockApiRepository);
      });
    },
  );
}
