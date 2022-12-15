import 'package:movies_api/app/data/models/config.dart';
import 'package:movies_api/core/utils/exports.dart';

class GetConfigurationApi implements UseCase<Config, NoParams> {
  final ApiRepository repository;

  GetConfigurationApi(this.repository);

  @override
  Future<Either<Failure, Config>> call(NoParams noParams) async {
    return await repository.getConfigurationApi();
  }
}
