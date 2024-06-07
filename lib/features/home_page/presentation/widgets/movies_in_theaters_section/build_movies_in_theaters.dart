import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/utils/extensions/url_helper.dart';
import 'package:movies_api/core/widgets/theater_component.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/movies_theaters_bloc/movies_in_theaters_bloc.dart';

class BuildMoviesInTheaters extends StatefulWidget {
  final ConfigurateApiLoaded confState;

  const BuildMoviesInTheaters(this.confState, {super.key});

  @override
  State<BuildMoviesInTheaters> createState() => _BuildMoviesInTheatersState();
}

class _BuildMoviesInTheatersState extends State<BuildMoviesInTheaters> {
  String url = "";
  String releaseDate = "";
  String title = "";
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesInTheatersBloc, MoviesInTheatersState>(
      builder: (context, theaterState) {
        if (theaterState is MoviesInTheatersLoaded) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              _getImagesFromApi(index, theaterState);
              _getImagesDetails(index, theaterState);

              return TheaterComponent(
                url: url,
                title: title,
                releaseDate: releaseDate,
                rating: rating,
              );
            },
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

    // * get rating
    rating = theaterState.movieInTheater.results![index].voteAverage!;
  }
}
