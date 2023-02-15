// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movies_api/core/widgets/gradient_circular_progress.dart';

class SliderImagesWidget extends StatefulWidget {
  final String url;

  const SliderImagesWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<SliderImagesWidget> createState() => _SliderImagesWidgetState();
}

class _SliderImagesWidgetState extends State<SliderImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          CachedNetworkImage(
            width: 200,
            imageUrl: widget.url,
            color: Colors.transparent,
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
        ],
      ),
    );
  }
}