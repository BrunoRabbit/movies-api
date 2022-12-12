import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/business_logic/blocs/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/business_logic/blocs/trending_api_bloc/trending_api_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
              if (confState is TrendingApiLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (confState is ConfigurateApiLoaded) {
                return BlocBuilder<TrendingApiBloc, TrendingApiState>(
                  builder: (context, trendState) {
                    if (trendState is TrendingApiLoaded) {
                      return CarouselSlider.builder(
                        options: CarouselOptions(
                            height: 275.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            }),
                        itemCount: 5,
                        itemBuilder: (context, itemIndex, pageViewIndex) {
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
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: 5,
            effect: const WormEffect(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSlider(
      TrendingApiLoaded trendState, ConfigurateApiLoaded confState, int index) {
    List<Widget> listImages = List.empty(growable: true);
    String? _baseUrl = confState.config.images!.baseUrl;
    String? _size = confState.config.images!.logoSizes!.last;
    String? _path = trendState.trending.results![index].backdropPath;

    String? _url = _baseUrl! + _size + _path!;
    // print(_url);
    // currentIndex = index;

    listImages.add(Expanded(
      child: Builder(
          builder: (context) => Container(
                width: 250,
                color: Colors.red,
                child: Center(child: Text('data $index')),
              )),
    ));

    return listImages;
  }
}
