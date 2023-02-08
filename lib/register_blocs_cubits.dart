import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/movies_theaters_bloc/movies_theaters_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/top_rated_bloc/top_rated_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/trending_api_bloc/trending_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/cubit/smooth_indicator_counter/smooth_indicator_cubit.dart';
import 'package:movies_api/service_locator.dart';

class RegisterBlocsCubits {
  static List<BlocProvider> registerBlocsCubits() => [
    BlocProvider<PopularApiBloc>(
      create: (_) => sl(),
    ),
    BlocProvider<ConfigurateApiBloc>(
      create: (_) => sl(),
    ),
    BlocProvider<TrendingApiBloc>(
      create: (_) => sl(),
    ),
    BlocProvider<TopRatedBloc>(
      create: (_) => sl(),
    ),
    BlocProvider<SmoothIndicatorCubit>(
      create: (_) => sl(),
    ),
    BlocProvider<MoviesTheatersBloc>(
      create: (_) => sl(),
    ),
  ];
}
