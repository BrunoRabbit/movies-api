import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_api/business_logic/blocs/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/business_logic/blocs/trending_api_bloc/trending_api_bloc.dart';

class BodyHomePage extends StatefulWidget {
  final PopularApiLoaded state;

  const BodyHomePage({
    Key? key,
    required this.state,
  }) : super(key: key);
  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  // List<String> movieImages = [];
  final String key = dotenv.get("apiKey");

  getLength() {
    print(widget.state.movie.results!.length); //20
  }

  getPopularMovies() {
    int index = widget.state.movie.totalResults ?? 0;
    String img = widget.state.movie.results![index].posterPath!;
    final url = 'https://api.themoviedb.org/3/movie/popular?api_key=$key&/$img';

    // for (var i = 0; i < index; i++) {

    // }
    getLength();
    print(widget.state.movie.page); //1

    // for (var e in widget.state.movie.results!) {
    //   print(e.id);
    // }

    // return Builder(
    //   builder: (context) => Container(
    //     width: MediaQuery.of(context).size.width,
    //     margin: const EdgeInsets.symmetric(horizontal: 5.0),
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: NetworkImage(
    //           images ?? '',
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<TrendingApiBloc, TrendingApiState>(
          listener: (context, state) {
            if (state is TrendingApiError) {
              print(state.error);
            }
          },
          builder: (context, state) {
            if (state is TrendingApiLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is TrendingApiLoaded) {
              print(state.trending.page);
              // for (var i = 0; i < state.trending.; i++) {

              // }
              return Container();
              // return CarouselSlider(
              //   children: [
              //     // Image.network(state.config.images!.baseUrl!),
              //   ],
              //   // children: getPopularMovies(widget.state.movie.totalResults!),
              // );
            }
            return Container();
          },
        ),
        SizedBox(
          height: 250,
          width: double.infinity,
          // color: Colors.yellow,
          child: Column(
            children: const [
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: movieImages.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         width: MediaQuery.of(context).size.width,
              //         margin: const EdgeInsets.symmetric(horizontal: 5.0),
              //         decoration: BoxDecoration(
              //           image: DecorationImage(
              //             image: NetworkImage(
              //               movieImages[index],
              //             ),
              //           ),
              //         ),
              //       );
              //       // return getPopularMovies(index);
              //     },
              //   ),
              // ),
              // Text(
              //   widget.state.movie.results['title'] ?? 'leandro',
              // ),
              // Text(
              //   state.Movie.accessibility!.toString(),
              // ),
              // Text(
              //   state.Movie.participants.toString(),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  // getApiImages(ConfigurateApiLoaded state) {
  //   print(state.config.images);
  // }
}
