import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/config.dart';
import 'package:movies_api/features/home_page/domain/entities/movie.dart';
import 'package:movies_api/features/home_page/domain/entities/movie_in_theater.dart';
import 'package:movies_api/features/home_page/domain/entities/top_rated.dart';
import 'package:movies_api/features/home_page/domain/entities/trending.dart';

abstract class ApiRepository {
  Future<Either<Failure, Config>> getConfigurationApi();
  Future<Either<Failure, Movie>> getPopularMovies();
  Future<Either<Failure, Trending>> getTrendingApi();
  Future<Either<Failure, TopRated>> getTopRated();
  Future<Either<Failure, MovieInTheater>> getMoviesInTheaters();
}
