import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/upcoming_movie.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';

class GetUpcomingApi implements UseCase<UpcomingMovie, NoParams> {
  ApiRepository repository;

  GetUpcomingApi(this.repository);

  @override
  Future<Either<Failure, UpcomingMovie>> call(NoParams params) async {
    return await repository.getUpcomingApi();
  }
}
