import 'package:movies_api/features/home_page/domain/entities/movie.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';
import 'package:movies_api/core/utils/exports.dart';

class GetPopularMovies implements UseCase<Movie, NoParams> {
  final ApiRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<Either<Failure, Movie>> call(NoParams noParams) async {
    return await repository.getPopularMovies();
  }
}
