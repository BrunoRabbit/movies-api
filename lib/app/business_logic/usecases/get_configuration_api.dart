import 'package:dartz/dartz.dart';
import 'package:movies_api/app/data/models/config.dart';
import 'package:movies_api/app/data/repositories/api_repository.dart';
import 'package:movies_api/core/utils/use_case.dart';

class GetConfigurationApi implements UseCase<Config, NoParams> {
  final ApiRepository repository;

  GetConfigurationApi(this.repository);

  @override
  Future<Either<NoParams, Config>> call(NoParams noParams) async {
    return await repository.getConfigurationApi();
  }
}
