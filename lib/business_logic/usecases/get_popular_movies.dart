import 'package:movies_api/data/models/movie.dart';
import 'package:movies_api/data/repositories/api_repository.dart';

class GetPopularMovies extends ApiRepository {
  final ApiRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<Movie> getPopularMovies() async {
    return await repository.getPopularMovies();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
