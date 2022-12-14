import 'package:dartz/dartz.dart';
import 'package:movies_api/app/data/models/config.dart';
import 'package:movies_api/app/data/models/movie.dart';
import 'package:movies_api/app/data/models/trending.dart';
import 'package:movies_api/core/utils/use_case.dart';

abstract class ApiRepository {
  Future<Either<NoParams, Config>> getConfigurationApi();
  Future<Either<NoParams, Movie>> getPopularMovies();
  Future<Either<NoParams, Trending>> getTrendingApi();
  // Future<Movie> getApiRecommendations();
}
