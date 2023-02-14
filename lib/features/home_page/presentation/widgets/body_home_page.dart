// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/carousel/carousel_slider_widget.dart';
import 'package:movies_api/features/home_page/presentation/widgets/movies_in_theaters_section/movies_theaters_section.dart';
import 'package:movies_api/features/home_page/presentation/widgets/popular_section/popular_movie_section.dart';
import 'package:movies_api/features/home_page/presentation/widgets/popular_section/popular_movie_section.dart';

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
          children: [
            // * The following components are displayed in the following order on the screen:
            // * Carousel: CarouselSlider on top on the screen
            // * PopularMovieSection: show in the middle of the screen several popular movies
            // * MoviesTheatersSection: show a section containing movies in theaters
            const CarouselSliderWidget(),
            const PopularMovieSection(),
            const MoviesTheatersSection(),
            Text(
              'Chegando em breve', // upcoming api
              style: TextThemes.headline2.semiBold,
            ),
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


