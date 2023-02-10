
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_api/core/utils/extensions/url_helper.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';

class ListViewPopularImages extends StatelessWidget {
  final PopularApiLoaded popularState;
  final ConfigurateApiLoaded confState;

  const ListViewPopularImages({
    Key? key,
    required this.popularState,
    required this.confState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        String? _baseUrl = confState.config.images!.baseUrl;
        String? _posterSize = confState.config.images!.posterSizes![4];

        String poster = popularState.movie.results![index].posterPath!;

        final url = _baseUrl!.concatUrl(_posterSize, poster);
        return Padding(
          padding: const EdgeInsets.only(right: 24 / 2),
          child: CachedNetworkImage(
            width: MediaQuery.of(context).size.height / 4.2,
            imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
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
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return const Center(
                child: GradientCircularProgress(),
              );
            },
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholderFadeInDuration: const Duration(milliseconds: 600),
          ),
        );
      },
    );
  }
}
