import 'package:dartz/dartz.dart';
import 'package:movies_api/core/utils/use_case.dart';
import 'package:movies_api/data/models/config.dart';
import 'package:movies_api/data/models/movie.dart';

abstract class ApiRepository {
  Future<Either<NoParams, Config>> getApiRequest();
  Future<Either<NoParams, Movie>> getPopularMovies();
  // Future<Movie> getApiRecommendations();
}
