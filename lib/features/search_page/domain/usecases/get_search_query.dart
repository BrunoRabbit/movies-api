import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/search_page/domain/entities/search_result.dart';
import 'package:movies_api/features/search_page/domain/repositories/search_api_repository.dart';

class GetSearchQuery extends UseCase<SearchResult, String> {
  SearchApiRepository repository;

  GetSearchQuery(this.repository);

  @override
  Future<Either<Failure, SearchResult>> call(String params) async {
    return await repository.getSearchQuery(params);
  }
}
