import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/core/utils/extensions/url_helper.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/upcoming_api_bloc/upcoming_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/upcoming_section/upcoming_movie_image.dart';

class BuildUpcomingApi extends StatefulWidget {
  final ConfigurateApiLoaded confState;

  const BuildUpcomingApi(this.confState, {Key? key}) : super(key: key);

  @override
  State<BuildUpcomingApi> createState() => _BuildUpcomingApiState();
}

class _BuildUpcomingApiState extends State<BuildUpcomingApi> {
  String url = "";
  String releaseDate = "";
  String title = "";
  double rating = 0.0;
  late double sectionHeight;
  late double sectionWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    sectionHeight = context.getSize(
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
    return BlocBuilder<UpcomingApiBloc, UpcomingApiState>(
      builder: (context, upcomingState) {
        if (upcomingState is UpcomingApiLoaded) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chegando em breve',
                  style: TextThemes.headline2.semiBold,
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: sectionHeight,
                  width: sectionWidth,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            _getImagesFromApi(index, upcomingState);
                            _getImagesDetails(index, upcomingState);

                            return UpcomingMovieImage(
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

  _getImagesFromApi(int index, UpcomingApiLoaded upcomingState) {
    String? baseUrl = widget.confState.config.images!.baseUrl;
    String? posterSize = widget.confState.config.images!.posterSizes![4];

    String poster = upcomingState.upcomingMovie.results![index].posterPath!;

    url = baseUrl!.concatUrl(posterSize, poster);
  }

  _getImagesDetails(int index, UpcomingApiLoaded upcomingState) {
    // * get release_date
    releaseDate = upcomingState.upcomingMovie.results![index].releaseDate!;

    // * get title
    title = upcomingState.upcomingMovie.results![index].title!;

    // * get rating
    rating = upcomingState.upcomingMovie.results![index].voteAverage!;
  }
}
