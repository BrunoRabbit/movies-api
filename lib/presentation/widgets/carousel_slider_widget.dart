import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/business_logic/blocs/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/business_logic/blocs/trending_api_bloc/trending_api_bloc.dart';
import 'package:movies_api/presentation/widgets/gradient_circular_progress.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          BlocBuilder<ConfigurateApiBloc, ConfigurateApiState>(
            builder: (context, confState) {
              if (confState is ConfigurateApiLoaded) {
                return BlocBuilder<TrendingApiBloc, TrendingApiState>(
                  builder: (context, trendState) {
                    if (trendState is TrendingApiLoaded) {
                      return CarouselSlider.builder(
                        options: CarouselOptions(
                            aspectRatio: 16 / 8.5,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            pauseAutoPlayOnManualNavigate: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 200),
                            enlargeCenterPage: true,
                            viewportFraction: 0.86,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            }),
                        itemCount: 5,
                        itemBuilder: (context, itemIndex, _) {
                          return Column(
                            children:
                                _buildSlider(trendState, confState, itemIndex),
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
          const SizedBox(
            height: 5,
          ),
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            duration: const Duration(milliseconds: 200),
            count: 5,
            effect: const WormEffect(
              activeDotColor: Color(0xFF1E1432),
              dotColor: Color(0xFF554B64),
              dotHeight: 12,
              dotWidth: 12,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSlider(
      TrendingApiLoaded trendState, ConfigurateApiLoaded confState, int index) {
    List<Widget> listImages = List.empty(growable: true);
    String? _baseUrl = confState.config.images!.baseUrl;
    String? _size = confState.config.images!.logoSizes![5];
    String? _path = trendState.trending.results![index].backdropPath;

    String? _url = _baseUrl! + _size + _path!;
    // currentIndex = index;

    listImages.add(SizedBox(
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: CachedNetworkImage(
        imageUrl: _url,
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
    ));

    return listImages;
  }
}
