// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/core/utils/extensions/url_helper.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/movies_theaters_bloc/movies_in_theaters_bloc.dart';

class MoviesTheatersSection extends StatelessWidget {
  const MoviesTheatersSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurateApiBloc, ConfigurateApiState>(
      builder: (context, confState) {
        if (confState is ConfigurateApiLoaded) {
          return BuildMoviesInTheatersBloc(confState);
        }

        return Container();
      },
    );
  }
}

class BuildMoviesInTheatersBloc extends StatefulWidget {
  final ConfigurateApiLoaded confState;

  const BuildMoviesInTheatersBloc(this.confState, {Key? key}) : super(key: key);

  @override
  State<BuildMoviesInTheatersBloc> createState() =>
      _BuildMoviesInTheatersBlocState();
}

class _BuildMoviesInTheatersBlocState extends State<BuildMoviesInTheatersBloc> {
  String url = "";
  String releaseDate = "";
  String title = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesInTheatersBloc, MoviesInTheatersState>(
      builder: (context, theaterState) {
        if (theaterState is MoviesInTheatersLoaded) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Filmes em cartaz', // now playing api
                  style: TextThemes.headline2.semiBold,
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 20 * 16,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      _getImagesFromApi(index, theaterState);
                      _getImagesDetails(index, theaterState);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: MediaQuery.of(context).size.height * 0.30,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 24 / 2),
                              child: CachedNetworkImage(
                                imageUrl: url,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black87,
                                        blurRadius: 4,
                                      )
                                    ],
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) {
                                  return const Center(
                                    child: GradientCircularProgress(),
                                  );
                                },
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                placeholderFadeInDuration:
                                    const Duration(milliseconds: 600),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.38,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    title,
                                    style: TextThemes.body2.semiBold,
                                  ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.38,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  releaseDate,
                                  style: TextThemes.subtitle1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  _getImagesFromApi(int index, MoviesInTheatersLoaded theaterState) {
    String? baseUrl = widget.confState.config.images!.baseUrl;
    String? posterSize = widget.confState.config.images!.posterSizes![4];

    String poster = theaterState.movieInTheater.results![index].posterPath!;

    url = baseUrl!.concatUrl(posterSize, poster);
  }

  _getImagesDetails(int index, MoviesInTheatersLoaded theaterState) {
    // * get release_date
    releaseDate = theaterState.movieInTheater.results![index].releaseDate!;

    // * get title
    title = theaterState.movieInTheater.results![index].title!;
  }
}
