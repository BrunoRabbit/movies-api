import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/search_page/data/repositories/search_repository_impl.dart';
import 'package:movies_api/features/search_page/domain/entities/search_result.dart';

import '../../../../core/network/network_status_test.mocks.dart';
import '../models/search_model_test_generate.mocks.dart';
import 'search_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SearchRepositoryImpl>(),
])
void main() {
  void checkIfDeviceHasInternet(Function body, {bool isHasInternet = true}) {
    MockNetworkStatusImpl networkStatusImpl = MockNetworkStatusImpl();

    when(networkStatusImpl.isConnected)
        .thenAnswer((_) async => isHasInternet ? true : false);

    body();
  }

  //? [getSearchQuery] group
  group('getSearchQuery', () {
    late String name;

    setUp((){
      name = "Jorje";
    });
    //? has internet
    checkIfDeviceHasInternet(isHasInternet: true, () {
      //! tests
      test('test getSearchQuery when connected', () async {
        final repositoryImpl = MockSearchRepositoryImpl();
        SearchResult tSearchResult = MockSearchResultModel();

        when(repositoryImpl.getSearchQuery(name))
            .thenAnswer((_) async => Right(tSearchResult));

        final result = await repositoryImpl.getSearchQuery(name);

        verify(repositoryImpl.getSearchQuery(name)).called(1);
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Right(tSearchResult));
      });
      test('call getSearchQuery and give error', () async {
        final repositoryImpl = MockSearchRepositoryImpl();

        when(repositoryImpl.getSearchQuery(name))
            .thenAnswer((_) async => Left(ServerFailure()));

        final result = await repositoryImpl.getSearchQuery(name);

        verify(repositoryImpl.getSearchQuery(name));
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(ServerFailure()));
      });
    });
    //? don't have internet
    checkIfDeviceHasInternet(isHasInternet: false, () {
      //! tests
      test('call getSearchQuery when don\'t have internet', () async {
        final repositoryImpl = MockSearchRepositoryImpl();

        when(repositoryImpl.getSearchQuery(name))
            .thenAnswer((_) async => Left(NoInternetConnection()));

        final result = await repositoryImpl.getSearchQuery(name);

        verify(repositoryImpl.getSearchQuery(name));
        verifyNoMoreInteractions(repositoryImpl);

        expect(result, Left(NoInternetConnection()));
      });
    });
  });
}
