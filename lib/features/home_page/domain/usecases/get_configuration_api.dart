import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/config.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';

class GetConfigurationApi implements UseCase<Config, NoParams> {
  final ApiRepository repository;

  GetConfigurationApi(this.repository);

  @override
  Future<Either<Failure, Config>> call(NoParams noParams) async {
    return await repository.getConfigurationApi();
  }
}
