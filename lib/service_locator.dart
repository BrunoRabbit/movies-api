import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_api/core/network/network_status.dart';
import 'package:movies_api/features/home_page/data/datasources/api_repository_remote_data_source.dart';
import 'package:movies_api/features/home_page/data/repositories/api_repository_impl.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_configuration_api.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_movies_in_theaters.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_popular_movies.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_top_rated.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_trending_api.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_upcoming_api.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/movies_theaters_bloc/movies_in_theaters_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/top_rated_bloc/top_rated_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/trending_api_bloc/trending_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/upcoming_api_bloc/upcoming_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/cubit/page_navigator_cubit/page_navigator_cubit.dart';
import 'package:movies_api/features/home_page/presentation/cubit/smooth_indicator_cubit/smooth_indicator_cubit.dart';
import 'package:movies_api/features/search_page/data/datasources/search_remote_datasources.dart';
import 'package:movies_api/features/search_page/data/repositories/search_repository_impl.dart';
import 'package:movies_api/features/search_page/domain/repositories/search_api_repository.dart';
import 'package:movies_api/features/search_page/domain/usecases/get_search_query.dart';
import 'package:movies_api/features/search_page/presentation/bloc/search_api_bloc/search_api_bloc.dart';
import 'package:movies_api/features/search_page/presentation/cubit/history_movie.dart';
import 'package:movies_api/features/search_page/presentation/cubit/page_search_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> setupLocator() async {
  //! Feature - HomePage
  // Bloc
  sl.registerFactory(
    () => ConfigurateApiBloc(
      getConfigurationApi: sl(),
    ),
  );
  sl.registerFactory(
    () => PopularApiBloc(
      getPopularMovies: sl(),
    ),
  );
  sl.registerFactory(
    () => TrendingApiBloc(
      getTrendingApi: sl(),
    ),
  );
  sl.registerFactory(
    () => TopRatedBloc(
      getTopRated: sl(),
    ),
  );
  sl.registerFactory(
    () => MoviesInTheatersBloc(
      getMoviesInTheaters: sl(),
    ),
  );
  sl.registerFactory(
    () => UpcomingApiBloc(
      getUpcomingApi: sl(),
    ),
  );

  // Cubit
  sl.registerFactory(
    () => SmoothIndicatorCubit(),
  );
  sl.registerFactory(
    () => PageNavigatorCubit(),
  );

  // Use Cases
  sl.registerLazySingleton<GetConfigurationApi>(
      () => GetConfigurationApi(sl()));
  sl.registerLazySingleton<GetPopularMovies>(() => GetPopularMovies(sl()));
  sl.registerLazySingleton<GetTrendingApi>(() => GetTrendingApi(sl()));
  sl.registerLazySingleton<GetTopRated>(() => GetTopRated(sl()));
  sl.registerLazySingleton<GetMoviesInTheaters>(
      () => GetMoviesInTheaters(sl()));
  sl.registerLazySingleton<GetUpcomingApi>(() => GetUpcomingApi(sl()));

  // Repository
  sl.registerLazySingleton<ApiRepository>(
    () => ApiRepositoryImpl(
      networkStatus: sl(),
      remoteApiRepository: sl(),
      // localApiRepository: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ApiRepositoryRemoteDataSource>(
    () => ApiRepositoryRemoteDataSourceImpl(),
  );
  // sl.registerLazySingleton<ApiRepositoryLocalDataSource>(
  //   () => ApiRepositoryLocalDataSourceImpl(),
  // );

  //! Feature - SearchPage
  // Bloc
  sl.registerFactory(
    () => SearchApiBloc(
      getSearchQuery: sl(),
    ),
  );

  // Cubit
  sl.registerFactory(
    () => HistoryMovieCubit(),
  );
  sl.registerFactory(
    () => PageSearchCubit(),
  );

  // Use Cases
  sl.registerLazySingleton<GetSearchQuery>(() => GetSearchQuery(sl()));

  // Repositories
  sl.registerLazySingleton<SearchApiRepository>(
    () => SearchRepositoryImpl(
      networkStatus: sl(),
      searchRemoteDatasources: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<SearchRemoteDatasources>(
    () => SearchRemoteDatasourcesImpl(),
  );

  // Core
  sl.registerLazySingleton<NetworkStatus>(
    () => NetworkStatusImpl(sl()),
  );

  //! External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
