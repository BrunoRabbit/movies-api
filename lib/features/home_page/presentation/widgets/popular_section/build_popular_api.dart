import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/core/utils/extensions/url_helper.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/popular_section/popular_movies_images.dart';

class BuildPopularApi extends StatefulWidget {
  final ConfigurateApiLoaded confState;

  const BuildPopularApi({
    Key? key,
    required this.confState,
  }) : super(key: key);

  @override
  State<BuildPopularApi> createState() => _BuildPopularApiState();
}

class _BuildPopularApiState extends State<BuildPopularApi> {
  String url = "";
  String releaseDate = "";
  String title = "";
  double rating = 0.0;
  late double sectionHeigth;
  late double sectionWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    sectionHeigth = context.getSize(
      MediaQuery.of(context).size.width / 2,
      MediaQuery.of(context).size.height * 0.43,
    );
    sectionWidth = context.getSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularApiBloc, PopularApiState>(
      builder: (context, popularState) {
        if (popularState is PopularApiLoaded) {
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                _getImages(index, popularState);
                _getImagesDetails(index, popularState);

                return PopularMoviesImages(
                  url: url,
                  title: title,
                  releaseDate: releaseDate,
                  rating: rating,
                );
              },
            ),
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

    url = _baseUrl!.concatUrl(_posterSize, poster);
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
