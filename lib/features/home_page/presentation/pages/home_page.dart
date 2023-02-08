import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';
import 'package:movies_api/core/widgets/gradient_scaffold.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/movies_theaters_bloc/movies_theaters_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/top_rated_bloc/top_rated_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/trending_api_bloc/trending_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/body_home_page.dart';

class HomePage extends StatefulWidget {
  final BuildContext context;

  const HomePage(
    this.context, {
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getConfigurateApi();
    getPopularApi();
    getTrendingApi();
    getTopRated();
    getMoviesTheater();
  }

  void getConfigurateApi() {
    BlocProvider.of<ConfigurateApiBloc>(context).add(ConfigurateApiLoad());
  }

  void getPopularApi() {
    BlocProvider.of<PopularApiBloc>(context).add(PopularApiLoad());
  }

  void getTrendingApi() {
    BlocProvider.of<TrendingApiBloc>(context).add(TrendingApiLoad());
  }

  void getTopRated() {
    BlocProvider.of<TopRatedBloc>(context).add(TopRatedLoad());
  }

   void getMoviesTheater() {
    BlocProvider.of<MoviesTheatersBloc>(context).add(MoviesTheatersLoad());
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: BlocBuilder<PopularApiBloc, PopularApiState>(
        builder: (context, state) {
          if (state is PopularApiLoaded) {
            return const BodyHomePage();
          }
          if (state is PopularApiLoading) {
            return const Center(
              child: GradientCircularProgress(),
            );
          }
          if (state is PopularApiError) {
            return Text("error: " + state.error);
          }
          return Container();
        },
      ),
    );
  }
}
