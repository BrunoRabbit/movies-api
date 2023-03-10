import 'package:dartz/dartz.dart';
import 'package:movies_api/core/error/failure.dart';
import 'package:movies_api/features/search_page/domain/entities/search_result.dart';

abstract class SearchApiRepository {
  Future<Either<Failure, SearchResult>> getSearchQuery(String name,
      {int page = 1});
}
