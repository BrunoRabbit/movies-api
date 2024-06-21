import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_api/core/utils/extensions/url_helper.dart';
import 'package:movies_api/core/widgets/theater_component.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/movie_overview_page/movie_overview_page.dart';

class BuildPopularApi extends StatefulWidget {
  final ConfigurateApiLoaded confState;

  const BuildPopularApi({super.key, required this.confState});

  @override
  State<BuildPopularApi> createState() => _BuildPopularApiState();
}

class _BuildPopularApiState extends State<BuildPopularApi> {
  String releaseDate = "";
  String title = "";
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularApiBloc, PopularApiState>(
      builder: (context, popularState) {
        if (popularState is PopularApiLoaded) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              _getImagesDetails(index, popularState);
              final url = _getImages(index, popularState);

              return GestureDetector(
                onTap: () {
                  final result = popularState.movie.results![index];

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MovieOverviewPage(
                        url: url,
                        title: result.title!,
                        rating: rating,
                        results: result,
                        releaseDate: releaseDate,
                      ),
                    ),
                  );
                },
                child: TheaterComponent(
                  url: url,
                  title: title,
                  releaseDate: releaseDate,
                  rating: rating,
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }

  _getImages(int index, PopularApiLoaded popularState) {
    String? _baseUrl = widget.confState.config.images!.baseUrl;
    String? _posterSize = widget.confState.config.images!.posterSizes![4];

    String poster = popularState.movie.results![index].posterPath!;

    return _baseUrl!.concatUrl(_posterSize, poster);
  }

  _getImagesDetails(int index, PopularApiLoaded popularState) {
    // * get release_date
    releaseDate = popularState.movie.results![index].releaseDate!;

    // * get title
    title = popularState.movie.results![index].title!;

    // * get rating
    rating = popularState.movie.results![index].voteAverage!;
  }
}
