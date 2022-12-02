import 'package:movies_api/data/models/config.dart';
import 'package:movies_api/data/models/movie.dart';

abstract class ApiRepository {
  Future<Config> getApiRequest();
  Future<Movie> getPopularMovies();
  // Future<Movie> getApiRecommendations();
}
