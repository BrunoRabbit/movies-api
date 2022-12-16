import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/trending.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';

class GetTrendingApi implements UseCase<Trending, NoParams> {
  final ApiRepository repository;

  GetTrendingApi(this.repository);

  @override
  Future<Either<Failure, Trending>> call(NoParams noParams) async {
    return await repository.getTrendingApi();
  }
}
