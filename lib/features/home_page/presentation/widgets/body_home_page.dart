// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/features/home_page/presentation/widgets/build_configurate_api.dart';
import 'package:movies_api/features/home_page/presentation/widgets/carousel_slider_widget.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CarouselSliderWidget(),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filmes Populares',
                style: TextThemes.headline2.semiBold,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 24 * 11,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: const [
                    // * Build Bloc's ConfigurateBloc and PopularBloc then Build ListView
                    BuildConfigurateApi(),
                  ],
                ),
              ),
            ],
          ),
        ),
        //         //           //NOVIDADES, TENDENCIAS,RECOMENDADOS, FAVORITOS
        //         //           Expanded(
        //         //             child: ListView.builder(
        //         //               itemCount: movieImages.length,
        //         //               itemBuilder: (context, index) {
        //         //                 return Container(
        //         //                   width: MediaQuery.of(context).size.width,
        //         //                   margin: const EdgeInsets.symmetric(horizontal: 5.0),
        //         //                   decoration: BoxDecoration(
        //         //                     image: DecorationImage(
        //         //                       image: NetworkImage(
        //         //                         movieImages[index],
        //         //                       ),
        //         //                     ),
        //         //                   ),
        //         //                 );
        //         //                 // return getPopularMovies(index);
        //         //               },
        //         //             ),
        //         //           ),
        //         //           Text(
        //         //             widget.state.movie.results['title'] ?? 'leandro',
        //         //           ),
        //         //           Text(
        //         //             state.movie.accessibility!.toString(),
        //         //           ),
        //         //           Text(
        //         //             state.movie.participants.toString(),
        //         //           ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
