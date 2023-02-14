import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';

class MovieInTheatesImages extends StatelessWidget {
  const MovieInTheatesImages({
    Key? key,
    required this.url,
    required this.title,
    required this.releaseDate,
  }) : super(key: key);

  final String url;
  final String title;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
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
  }
}
