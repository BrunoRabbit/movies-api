import 'package:dartz/dartz.dart';
import 'package:movies_api/app/data/models/config.dart';
import 'package:movies_api/app/data/models/movie.dart';
import 'package:movies_api/app/data/models/trending.dart';
import 'package:movies_api/core/utils/failure.dart';

abstract class ApiRepository {
  Future<Either<Failure, Config>> getConfigurationApi();
  Future<Either<Failure, Movie>> getPopularMovies();
  Future<Either<Failure, Trending>> getTrendingApi();
  // Future<Movie> getApiRecommendations();
}
