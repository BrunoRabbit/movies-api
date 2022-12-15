import 'package:movies_api/app/data/models/trending.dart';
import 'package:movies_api/core/utils/exports.dart';

class GetTrendingApi implements UseCase<Trending, NoParams> {
  final ApiRepository repository;

  GetTrendingApi(this.repository);

  @override
  Future<Either<Failure, Trending>> call(NoParams noParams) async {
    return await repository.getTrendingApi();
  }
}
