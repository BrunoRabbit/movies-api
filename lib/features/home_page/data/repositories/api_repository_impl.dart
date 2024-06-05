import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/core/network/network_status.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/features/home_page/domain/entities/config.dart';
import 'package:movies_api/features/home_page/domain/entities/movie.dart';
import 'package:movies_api/features/home_page/domain/entities/movie_in_theater.dart';
import 'package:movies_api/features/home_page/domain/entities/top_rated.dart';
import 'package:movies_api/features/home_page/domain/entities/trending.dart';
import 'package:movies_api/features/home_page/domain/entities/upcoming_movie.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiRepositoryRemoteDataSource remoteApiRepository;
  final NetworkStatus networkStatus;

  ApiRepositoryImpl({
    required this.remoteApiRepository,
    required this.networkStatus,
  });

  @override
  Future<Either<Failure, Config>> getConfigurationApi() async {
    if (SizeHelper.isWeb || networkStatus.isConnected) {
      try {
        final config = await remoteApiRepository.getConfigurationApi();

        return Right(config);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }

  @override
  Future<Either<Failure, Movie>> getPopularMovies() async {
    if (SizeHelper.isWeb || networkStatus.isConnected) {
      try {
        final movie = await remoteApiRepository.getPopularMovies();

        return Right(movie);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }

  @override
  Future<Either<Failure, Trending>> getTrendingApi() async {
    if (SizeHelper.isWeb || networkStatus.isConnected) {
      try {
        final trending = await remoteApiRepository.getTrendingApi();

        return Right(trending);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }

  @override
  Future<Either<Failure, TopRated>> getTopRated() async {
    if (SizeHelper.isWeb || networkStatus.isConnected) {
      try {
        final topRated = await remoteApiRepository.getTopRatedApi();

        return Right(topRated);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }

  @override
  Future<Either<Failure, MovieInTheater>> getMoviesInTheaters() async {
    if (SizeHelper.isWeb || networkStatus.isConnected) {
      try {
        final movieInTheater = await remoteApiRepository.getMoviesInTheaters();

        return Right(movieInTheater);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }

  @override
  Future<Either<Failure, UpcomingMovie>> getUpcomingApi() async {
    if (SizeHelper.isWeb || networkStatus.isConnected) {
      try {
        final upComingMovie = await remoteApiRepository.getUpcomingApi();

        return Right(upComingMovie);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }
}
