import 'package:mockito/annotations.dart';
import 'package:movies_api/features/search_page/domain/entities/search_result.dart';
import 'package:movies_api/features/search_page/domain/repositories/search_api_repository.dart';
import 'package:movies_api/features/search_page/domain/usecases/get_search_query.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';

import 'get_search_query_test.mocks.dart';

class MockSearchResult extends Mock implements SearchResult {}

@GenerateNiceMocks([
  MockSpec<SearchApiRepository>(),
])
void main() {
  late SearchApiRepository searchApiRepository;
  late GetSearchQuery usecase;
  late String name;

  final SearchResult tSearchResult = MockSearchResult();

  setUp(() {
    searchApiRepository = MockSearchApiRepository();
    usecase = GetSearchQuery(searchApiRepository);
    name = "Some name";
  });

  group('usecase getSearchQuery', () {
    test(
      'when a successfull call occurs should return [SearchResult] entity',
      () async {
        when(searchApiRepository.getSearchQuery(name))
            .thenAnswer((_) async => Right(tSearchResult));

        final result = await usecase(name);

        verify(searchApiRepository.getSearchQuery(name));
        verifyNoMoreInteractions(searchApiRepository);

        expect(result, Right(tSearchResult));
      },
    );

    test(
        'call succeeds but generates an error, it should return [ServerFailure]',
        () async {
      when(searchApiRepository.getSearchQuery(name))
          .thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase(name);

      verify(searchApiRepository.getSearchQuery(name));
      verifyNoMoreInteractions(searchApiRepository);

      expect(result, Left(ServerFailure()));
    });

    test(
        'call succeeds but generates an error, it should return [NoInternetConnection]',
        () async {
      when(searchApiRepository.getSearchQuery(name))
          .thenAnswer((_) async => Left(NoInternetConnection()));

      final result = await usecase(name);

      verify(searchApiRepository.getSearchQuery(name));
      verifyNoMoreInteractions(searchApiRepository);

      expect(result, Left(NoInternetConnection()));
    });
  });
}
