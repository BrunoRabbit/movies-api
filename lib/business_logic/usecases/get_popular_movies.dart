import 'package:dartz/dartz.dart';
import 'package:movies_api/core/utils/use_case.dart';
import 'package:movies_api/data/models/movie.dart';
import 'package:movies_api/data/repositories/api_repository.dart';

class GetPopularMovies implements UseCase<Movie, NoParams> {
  final ApiRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<Either<NoParams, Movie>> call(NoParams noParams) async {
    return await repository.getPopularMovies();
  }
}
