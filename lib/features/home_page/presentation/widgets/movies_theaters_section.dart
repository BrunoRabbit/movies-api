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
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filmes em cartaz', // now playing api
            style: TextThemes.headline2.semiBold,
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 24 * 11,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                BlocBuilder<ConfigurateApiBloc, ConfigurateApiState>(
                  builder: (context, confState) {
                    if (confState is ConfigurateApiLoaded) {
                      return BlocBuilder<MoviesInTheatersBloc,
                          MoviesInTheatersState>(
                        builder: (context, popularState) {
                          if (popularState is MoviesInTheatersLoaded) {
                            return Flexible(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  String? _baseUrl =
                                      confState.config.images!.baseUrl;
                                  String? _posterSize =
                                      confState.config.images!.posterSizes![4];

                                  String poster = popularState
                                      .movieInTheater.results![index].posterPath!;

                                  final url =
                                      _baseUrl!.concatUrl(_posterSize, poster);
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(right: 24 / 2),
                                    child: CachedNetworkImage(
                                      width: 24 * 7,
                                      imageUrl: url,
                                      color: Colors.transparent,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                  );
                                },
                              ),
                            );
                          }
                          return Container();
                        },
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
