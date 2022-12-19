import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/carousel_slider_widget.dart';

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
  final String key = dotenv.get("API_KEY");

  getLength() {
    print(widget.state.movie.results!.length); //20
  }

  // getPopularMovies() {
  //   int index = widget.state.movie.totalResults ?? 0;
  //   String img = widget.state.movie.results![index].posterPath!;
  //   final url = 'https://api.themoviedb.org/3/movie/popular?api_key=$key&/$img';

  //   getLength();
  //   print(widget.state.movie.page); //1
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CarouselSliderWidget(),
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

  // getApiImages(TrendingApiLoaded state) {
  //   print(state.config.images);
  // }
}
