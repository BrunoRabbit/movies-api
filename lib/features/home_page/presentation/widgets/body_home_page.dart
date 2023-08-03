import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/carousel/carousel_slider_widget.dart';
import 'package:movies_api/features/home_page/presentation/widgets/movies_in_theaters_section/movies_theaters_section.dart';
import 'package:movies_api/features/home_page/presentation/widgets/popular_section/popular_movie_section.dart';
import 'package:movies_api/features/home_page/presentation/widgets/upcoming_section/upcoming_section.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  final Duration _intervalWaitDuration = const Duration(seconds: 2);
  bool isRefreshable = true;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _refreshPosterMovies(),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            CarouselSliderWidget(),
            PopularMovieSection(),
            MoviesTheatersSection(),
            UpcomingSection(),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshPosterMovies() async {
    if (!isRefreshable) return;

    if (isRefreshable) {
      isRefreshable = false;

      await Future.delayed(_intervalWaitDuration, () => isRefreshable = true);
      getApi();
    }
  }

  void getApi() {
    BlocProvider.of<ConfigurateApiBloc>(context).add(ConfigurateApiLoad());
    BlocProvider.of<PopularApiBloc>(context).add(PopularApiLoad());
    // BlocProvider.of<TrendingApiBloc>(context).add(TrendingApiLoad());
    // BlocProvider.of<TopRatedBloc>(context).add(TopRatedLoad());
  }
}
