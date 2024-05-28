import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/widgets/custom_drawer/custom_drawer_cubit.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/movies_theaters_bloc/movies_in_theaters_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/top_rated_bloc/top_rated_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/trending_api_bloc/trending_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/upcoming_api_bloc/upcoming_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/cubit/page_navigator_cubit/page_navigator_cubit.dart';
import 'package:movies_api/features/home_page/presentation/cubit/smooth_indicator_cubit/smooth_indicator_cubit.dart';
import 'package:movies_api/features/search_page/presentation/bloc/search_api_bloc/search_api_bloc.dart';
import 'package:movies_api/features/search_page/presentation/cubit/history_movie.dart';
import 'package:movies_api/features/search_page/presentation/cubit/page_search_cubit.dart';
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
        BlocProvider<MoviesInTheatersBloc>(
          create: (_) => sl(),
        ),
        BlocProvider<UpcomingApiBloc>(
          create: (_) => sl(),
        ),
        BlocProvider<SearchApiBloc>(
          create: (_) => sl(),
        ),
        BlocProvider<PageNavigatorCubit>(
          create: (_) => sl(),
        ),
        BlocProvider<HistoryMovieCubit>(
          create: (_) => sl(),
        ),
        BlocProvider<PageSearchCubit>(
          create: (_) => sl(),
        ),
         BlocProvider<CustomDrawerCubit>(
          create: (_) => sl(),
        ),
      ];
}
