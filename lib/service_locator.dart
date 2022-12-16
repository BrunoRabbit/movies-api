import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_api/core/network/network_status.dart';
import 'package:movies_api/features/home_page/data/datasources/api_repository_remote_data_source.dart';
import 'package:movies_api/features/home_page/data/repositories/api_repository_impl.dart';
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_configuration_api.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_popular_movies.dart';
import 'package:movies_api/features/home_page/domain/usecases/get_trending_api.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/trending_api_bloc/trending_api_bloc.dart';
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

  // Use Cases
  sl.registerLazySingleton<GetConfigurationApi>(
      () => GetConfigurationApi(sl()));
  sl.registerLazySingleton<GetPopularMovies>(() => GetPopularMovies(sl()));
  sl.registerLazySingleton<GetTrendingApi>(() => GetTrendingApi(sl()));

  // Repository
  sl.registerLazySingleton<ApiRepository>(
    () => ApiRepositoryImpl(
      networkStatus: sl(),
      remoteApiRepository: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ApiRepositoryRemoteDataSource>(
    () => ApiRepositoryRemoteDataSourceImpl(),
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
