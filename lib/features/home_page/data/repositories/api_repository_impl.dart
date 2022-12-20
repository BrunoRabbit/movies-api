import 'package:movies_api/core/error/exceptions.dart';
import 'package:movies_api/core/network/network_status.dart';
import 'package:movies_api/core/utils/exports.dart';
import 'package:movies_api/features/home_page/domain/entities/config.dart';
import 'package:movies_api/features/home_page/domain/entities/movie.dart';
import 'package:movies_api/features/home_page/domain/entities/trending.dart';
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
    if (await networkStatus.isConnected) {
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
    if (await networkStatus.isConnected) {
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
    if (await networkStatus.isConnected) {
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
}