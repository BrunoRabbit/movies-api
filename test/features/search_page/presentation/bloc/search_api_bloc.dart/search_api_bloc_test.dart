import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/data/models/trending_model.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_trending_api.dart';
import 'package:movies_api/features/home_page/presentation/bloc/trending_api_bloc/trending_api_bloc.dart';
import 'package:movies_api/features/search_page/data/models/search_result_model.dart';
import 'package:movies_api/features/search_page/domain/usecases/get_search_query.dart';
import 'package:movies_api/features/search_page/presentation/bloc/search_api_bloc/search_api_bloc.dart';

import '../../../data/models/search_model_test_generate.mocks.dart';
import '../../../domain/usecases/get_search_query_test.mocks.dart';


void main() {
  //mock
  MockSearchApiRepository mockSearchRepository = MockSearchApiRepository();
  late GetSearchQuery usecase;
  late SearchApiBloc searchApiBloc;
  late String name;

  //mock model
  SearchResultModel tSearchResultModel = MockSearchResultModel();

  group('event SearchQueryLoad', () {
    setUp(() {
      usecase = GetSearchQuery(mockSearchRepository);
      searchApiBloc = SearchApiBloc(getSearchQuery: usecase);
      name = "Some name";
    });

    test('initial state is SearchApiInitial', () {
      expect(searchApiBloc.state, isA<SearchApiInitial>());
      searchApiBloc.close();
    });

    blocTest<SearchApiBloc, SearchApiState>(
      'when an successfull call occurs emit a [SearchApiLoaded]',
      build: () {
        when(searchApiBloc.getSearchQuery(name))
            .thenAnswer((_) async => Right(tSearchResultModel));
        return searchApiBloc;
      },
      act: (bloc) => bloc.add(SearchQueryLoad(name: name)),
      wait: const Duration(seconds: 1),
      expect: () => [isA<SearchApiLoading>(), isA<SearchApiLoaded>()],
    );

    blocTest<SearchApiBloc, SearchApiState>(
      'when an error [ServerFailure] occurs emit a [SearchApiError]',
      build: () {
        when(mockSearchRepository.getSearchQuery(name))
            .thenAnswer((_) async => Left(ServerFailure()));
        return searchApiBloc;
      },
      act: (bloc) => bloc.add(SearchQueryLoad(name: name)),
      wait: const Duration(seconds: 1),
      expect: () => [isA<SearchApiLoading>(), isA<SearchApiError>()],
    );

    blocTest<SearchApiBloc, SearchApiState>(
      'when an error [NoInternetConnection] occurs emit a [SearchApiError]',
      build: () {
        when(searchApiBloc.getSearchQuery(name))
            .thenAnswer((_) async => Left(NoInternetConnection()));
        return searchApiBloc;
      },
      act: (bloc) => bloc.add(SearchQueryLoad(name: name)),
      wait: const Duration(seconds: 1),
      expect: () => [isA<SearchApiLoading>(), isA<SearchApiError>()],
    );
  });
}
