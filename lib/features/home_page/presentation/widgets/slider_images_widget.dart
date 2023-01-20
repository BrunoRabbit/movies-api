import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';

class SliderImagesWidget extends StatelessWidget {
  final String url;

  const SliderImagesWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) =>
            const Center(child: GradientCircularProgress()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
