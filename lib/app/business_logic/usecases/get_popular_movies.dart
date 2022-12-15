import 'package:movies_api/app/data/models/movie.dart';
import 'package:movies_api/core/utils/exports.dart';

class GetPopularMovies implements UseCase<Movie, NoParams> {
  final ApiRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<Either<Failure, Movie>> call(NoParams noParams) async {
    return await repository.getPopularMovies();
  }
}
