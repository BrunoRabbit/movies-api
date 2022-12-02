import 'package:movies_api/data/models/config.dart';
import 'package:movies_api/data/repositories/api_repository.dart';

class GetApiRequest extends ApiRepository {
  final ApiRepository repository;

  GetApiRequest(this.repository);

  @override
  Future<Config> getApiRequest() async {
    return await repository.getApiRequest();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
