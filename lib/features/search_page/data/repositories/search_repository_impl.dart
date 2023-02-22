// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:dartz/dartz.dart';
import 'package:movies_api/core/error/exceptions.dart';

import 'package:movies_api/core/error/failure.dart';
import 'package:movies_api/core/network/network_status.dart';
import 'package:movies_api/features/search_page/data/datasources/search_remote_datasources.dart';
import 'package:movies_api/features/search_page/domain/entities/search_result.dart';
import 'package:movies_api/features/search_page/domain/repositories/search_api_repository.dart';

class SearchRepositoryImpl implements SearchApiRepository {
  final NetworkStatus networkStatus;
  final SearchRemoteDatasources searchRemoteDatasources;
  
  SearchRepositoryImpl({
    required this.networkStatus,
    required this.searchRemoteDatasources,
  });

  @override
  Future<Either<Failure, SearchResult>> getSearchQuery(String name) async {
    if (await networkStatus.isConnected) {
      try {
        final searchResult = await searchRemoteDatasources.getSearchQuery(name);

        return Right(searchResult);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }
  
}
