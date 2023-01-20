import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/top_rated_bloc/top_rated_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/slider_images_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_api/core/utils/extensions/url_helper.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int currentIndex = 0;
  // late final SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    // initializeSharedPref();
  }

  // void initializeSharedPref() async {
  //   pref = await SharedPreferences.getInstance();
  // }

  @override
  Widget build(BuildContext context) {
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
                            children: List.generate(5, (index) {
                              String? _baseUrl =
                                  confState.config.images!.baseUrl;
                              String? _size =
                                  confState.config.images!.logoSizes![5];
                              String? _path = topRatedState
                                  .topRated.results![index].backdropPath;

                              String? _url = _baseUrl?.concatUrl(_size, _path!);

                              return SliderImagesWidget(url: _url!);
                            }),
                          );
                          // return Column(
                          //   children: _buildSlider(
                          //       topRatedState, confState, itemIndex),
                          // );
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
}
