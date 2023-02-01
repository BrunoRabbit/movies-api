import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';

class SliderImagesWidget extends StatefulWidget {
  final String url;

  const SliderImagesWidget({super.key, required this.url});

  @override
  State<SliderImagesWidget> createState() => _SliderImagesWidgetState();
}

class _SliderImagesWidgetState extends State<SliderImagesWidget> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: widget.url,
            color: Colors.transparent,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            progressIndicatorBuilder: (context, _, downloadProgress) {
              if (downloadProgress.downloaded == 0) isLoading = false;

              return const Center(
                child: GradientCircularProgress(),
              );
            },
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholderFadeInDuration: const Duration(milliseconds: 600),
          ),
          !isLoading
              ? Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                      begin: FractionalOffset.topRight,
                      end: const FractionalOffset(0.9, 0),
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black.withOpacity(0.25),
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
