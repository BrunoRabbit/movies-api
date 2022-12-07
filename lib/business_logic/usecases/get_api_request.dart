import 'package:dartz/dartz.dart';
import 'package:movies_api/core/utils/use_case.dart';
import 'package:movies_api/data/models/config.dart';
import 'package:movies_api/data/repositories/api_repository.dart';

class GetApiRequest implements UseCase<Config, NoParams> {
  final ApiRepository repository;

  GetApiRequest(this.repository);

  @override
  Future<Either<NoParams, Config>> call(NoParams noParams) async {
    return await repository.getApiRequest();
  }
}
