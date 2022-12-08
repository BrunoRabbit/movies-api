import 'package:get_it/get_it.dart';
import 'package:movies_api/business_logic/blocs/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/business_logic/blocs/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/business_logic/blocs/trending_api_bloc/trending_api_bloc.dart';
import 'package:movies_api/business_logic/usecases/get_configuration_api.dart';
import 'package:movies_api/business_logic/usecases/get_popular_movies.dart';
import 'package:movies_api/business_logic/usecases/get_trending_api.dart';
import 'package:movies_api/data/models/images.dart';
import 'package:movies_api/data/models/movie.dart';
import 'package:movies_api/data/models/results.dart';
import 'package:movies_api/data/models/trending.dart';
import 'package:movies_api/data/models/trendings_details.dart';
import 'package:movies_api/data/repositories/api_repository.dart';
import 'package:movies_api/data/repositories/api_repository_impl.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(
  initializerName: r'$setupLocator',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> setupLocator(GetIt sl) async {
  //Bloc
  sl.registerFactory<ConfigurateApiBloc>(
    () => ConfigurateApiBloc(
      getConfigurationApi: sl<GetConfigurationApi>(),
    ),
  );
  sl.registerFactory(
    () => PopularApiBloc(
      getPopularMovies: sl<GetPopularMovies>(),
    ),
  );
  sl.registerFactory(
    () => TrendingApiBloc(
      getTrendingApi: sl<GetTrendingApi>(),
    ),
  );

  //Model
  sl.registerFactory<Movie>(() => Movie(
        page: sl(),
        results: sl(),
        totalPages: sl(),
        totalResults: sl(),
      ));
  sl.registerFactory<Images>(() => Images(
        backdropSizes: sl(),
        baseUrl: sl(),
        secureBaseUrl: sl(),
        logoSizes: sl(),
        posterSizes: sl(),
        profileSizes: sl(),
        stillSizes: sl(),
      ));
  sl.registerFactory<Results>(() => Results(
        adult: sl(),
        backdropPath: sl(),
        id: sl(),
        title: sl(),
        originalLanguage: sl(),
        originalTitle: sl(),
        overview: sl(),
        posterPath: sl(),
        mediaType: sl(),
        genreIds: sl(),
        popularity: sl(),
        releaseDate: sl(),
        video: sl(),
        voteAverage: sl(),
        voteCount: sl(),
      ));
  sl.registerFactory<Trending>(() => Trending(
        page: sl(),
        results: sl(),
        totalPages: sl(),
        totalResults: sl(),
      ));
  sl.registerFactory<TrendingsDetails>(() => TrendingsDetails(
        adult: sl(),
        backdropPath: sl(),
        id: sl(),
        title: sl(),
        originalLanguage: sl(),
        originalTitle: sl(),
        overview: sl(),
        posterPath: sl(),
        genreIds: sl(),
        popularity: sl(),
        releaseDate: sl(),
        video: sl(),
        voteAverage: sl(),
        voteCount: sl(),
      ));

  //Repository
  // sl.registerLazySingleton<ApiRepositoryImpl>(
  //   () => ApiRepositoryImpl(),
  // );
  sl.registerLazySingleton<ApiRepository>(
    () => ApiRepositoryImpl(),
  );
  //UseCase
  sl.registerLazySingleton<GetConfigurationApi>(
      () => GetConfigurationApi(sl()));
  sl.registerLazySingleton<GetPopularMovies>(() => GetPopularMovies(sl()));
}
