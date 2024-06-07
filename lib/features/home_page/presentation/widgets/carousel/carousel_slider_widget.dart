import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/top_rated_bloc/top_rated_bloc.dart';
import 'package:movies_api/features/home_page/presentation/cubit/smooth_indicator_cubit/smooth_indicator_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_api/core/utils/extensions/url_helper.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  late SmoothIndicatorCubit cubit;
  int totalItemCount = 5;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<SmoothIndicatorCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = SizeHelper.isWebSize(context);

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          BlocBuilder<ConfigurateApiBloc, ConfigurateApiState>(
            builder: (context, confState) {
              if (confState is ConfigurateApiLoaded) {
                return BlocBuilder<TopRatedBloc, TopRatedState>(
                  builder: (context, topRatedState) {
                    if (topRatedState is TopRatedLoaded) {
                      return CarouselSlider.builder(
                        options: CarouselOptions(
                            aspectRatio: isWeb ? 35 / 8 : 19 / 14,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            pauseAutoPlayOnManualNavigate: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 200),
                            enlargeCenterPage: isWeb ? false : true,
                            viewportFraction: isWeb ? .18 : .55,
                            onPageChanged: (index, reason) {
                              cubit.counter(index);
                            }),
                        itemCount: totalItemCount,
                        itemBuilder: (context, itemIndex, _) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: BuildImages(
                              confState: confState,
                              topRatedState: topRatedState,
                              itemIndex: itemIndex,
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                );
              }
              return Container();
            },
          ),
          BlocBuilder<SmoothIndicatorCubit, SmoothIndicatorState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: AnimatedSmoothIndicator(
                  activeIndex: state.value,
                  duration: const Duration(milliseconds: 200),
                  count: totalItemCount,
                  effect: const WormEffect(
                    activeDotColor: Color(0xFF1E1432),
                    dotColor: Color(0xFF554B64),
                    dotHeight: 12,
                    dotWidth: 12,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BuildImages extends StatelessWidget {
  const BuildImages({
    Key? key,
    required this.confState,
    required this.topRatedState,
    required this.itemIndex,
  }) : super(key: key);

  final ConfigurateApiLoaded confState;
  final TopRatedLoaded topRatedState;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    // * Build Urls Logos
    String? _baseUrl = confState.config.images!.baseUrl;

    // * Build Urls Poster
    String? _posterSize = confState.config.images!.posterSizes![4];
    String? _posterPath = topRatedState.topRated.results![itemIndex].posterPath;

    String? _posterUrl = _baseUrl?.concatUrl(_posterSize, _posterPath!);

    return CachedNetworkImage(
      // width: constraints.maxWidth,
      // height: constraints.maxHeight,
      imageUrl: _posterUrl!,
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
            fit: BoxFit.fill,
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
    );
  }
}
