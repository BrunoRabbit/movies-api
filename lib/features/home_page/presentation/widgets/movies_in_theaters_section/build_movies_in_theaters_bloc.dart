import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/core/utils/extensions/url_helper.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/movies_theaters_bloc/movies_in_theaters_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/movies_in_theaters_section/movies_in_theaters_images.dart';

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
                  'Filmes em cartaz',
                  style: TextThemes.headline2.semiBold,
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: sectionHeigth,
                  width: sectionWidth,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            _getImagesFromApi(index, theaterState);
                            _getImagesDetails(index, theaterState);
                      
                            return MovieInTheatesImages(
                              url: url,
                              title: title,
                              releaseDate: releaseDate,
                              rating: rating,
                            );
                          },
                        ),
                      ),
                    ],
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

    // * get rating
    rating = theaterState.movieInTheater.results![index].voteAverage!;
  }
}
