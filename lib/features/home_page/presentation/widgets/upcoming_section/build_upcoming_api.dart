import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/core/utils/extensions/url_helper.dart';
import 'package:movies_api/core/widgets/theater_component.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/upcoming_api_bloc/upcoming_api_bloc.dart';
import 'package:movies_api/features/movie_overview_page/movie_overview_page.dart';

class BuildUpcomingApi extends StatefulWidget {
  final ConfigurateApiLoaded confState;

  const BuildUpcomingApi(this.confState, {super.key});

  @override
  State<BuildUpcomingApi> createState() => _BuildUpcomingApiState();
}

class _BuildUpcomingApiState extends State<BuildUpcomingApi> {
  String releaseDate = "";
  String title = "";
  double rating = 0.0;
  late double sectionHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final isWeb = SizeHelper.isWebSize(context);

    sectionHeight = !isWeb ? context.getSizeOrientation(350, 350) : 350;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingApiBloc, UpcomingApiState>(
      builder: (context, upcomingState) {
        if (upcomingState is UpcomingApiLoaded) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, top: 24, right: 12),
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
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 20),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      String url = _getImagesFromApi(index, upcomingState);
                      _getImagesDetails(index, upcomingState);

                      return GestureDetector(
                        onTap: () {
                          final result =
                              upcomingState.upcomingMovie.results![index];

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

    return baseUrl!.concatUrl(posterSize, poster);
  }

  _getImagesDetails(int index, UpcomingApiLoaded upcomingState) {
    // * get release_date
    DateTime? releaseDateTime = DateTime.tryParse(
        upcomingState.upcomingMovie.results![index].releaseDate!);

    if (releaseDateTime != null && releaseDateTime.isBefore(DateTime.now())) {
      releaseDate = upcomingState.upcomingMovie.results![index].releaseDate!;
    } else {
      releaseDate = "TBA";
    }

    // * get title
    title = upcomingState.upcomingMovie.results![index].title!;

    // * get rating
    rating = upcomingState.upcomingMovie.results![index].voteAverage!;
  }
}
