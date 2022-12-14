import 'package:dartz/dartz.dart';
import 'package:movies_api/app/data/models/trending.dart';
import 'package:movies_api/app/data/repositories/api_repository.dart';
import 'package:movies_api/core/utils/use_case.dart';

class GetTrendingApi implements UseCase<Trending, NoParams> {
  final ApiRepository repository;

  GetTrendingApi(this.repository);

  @override
  Future<Either<NoParams, Trending>> call(NoParams noParams) async {
    return await repository.getTrendingApi();
  }
}
