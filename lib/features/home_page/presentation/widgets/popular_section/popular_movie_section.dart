import 'package:flutter/material.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/features/home_page/presentation/widgets/popular_section/build_configurate_api.dart';

class PopularMovieSection extends StatefulWidget {
  const PopularMovieSection({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularMovieSection> createState() => _PopularMovieSectionState();
}

class _PopularMovieSectionState extends State<PopularMovieSection> {
  late double sectionHeigth;
  late double sectionWidth;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    sectionHeigth = context.getSize(
      MediaQuery.of(context).size.width / 2,
      MediaQuery.of(context).size.height * 0.43,
    );
    sectionWidth = context.getSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            height: sectionHeigth,
            width: sectionWidth,
            child: Row(
              children: const [
                // * Build Bloc's ConfigurateBloc and PopularBloc then Build ListView
                BuildConfigurateApi(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
