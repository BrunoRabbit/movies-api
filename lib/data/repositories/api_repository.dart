import 'package:dartz/dartz.dart';
import 'package:movies_api/core/utils/use_case.dart';
import 'package:movies_api/data/models/config.dart';
import 'package:movies_api/data/models/movie.dart';
import 'package:movies_api/data/models/trending.dart';

abstract class ApiRepository {
  Future<Either<NoParams, Config>> getConfigurationApi();
  Future<Either<NoParams, Movie>> getPopularMovies();
  Future<Either<NoParams, Trending>> getTrendingApi();
  // Future<Movie> getApiRecommendations();
}
