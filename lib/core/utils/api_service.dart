import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/movies_theaters_bloc/movies_in_theaters_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/top_rated_bloc/top_rated_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/trending_api_bloc/trending_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/upcoming_api_bloc/upcoming_api_bloc.dart';

class ApiService {
  static void loadAllApis(BuildContext context) {
    _getConfigurateApi(context);
    _getPopularApi(context);
    _getTrendingApi(context);
    _getTopRated(context);
    _getMoviesTheater(context);
    _getUpcomingApi(context);
  }

  static void _getConfigurateApi(BuildContext context) {
    BlocProvider.of<ConfigurateApiBloc>(context).add(ConfigurateApiLoad());
  }

  static void _getPopularApi(BuildContext context) {
    BlocProvider.of<PopularApiBloc>(context).add(PopularApiLoad());
  }

  static void _getTrendingApi(BuildContext context) {
    BlocProvider.of<TrendingApiBloc>(context).add(TrendingApiLoad());
  }

  static void _getTopRated(BuildContext context) {
    BlocProvider.of<TopRatedBloc>(context).add(TopRatedLoad());
  }

  static void _getMoviesTheater(BuildContext context) {
    BlocProvider.of<MoviesInTheatersBloc>(context).add(MoviesInTheatersLoad());
  }

  static void _getUpcomingApi(BuildContext context) {
    BlocProvider.of<UpcomingApiBloc>(context).add(UpcomingApiLoad());
  }
}
