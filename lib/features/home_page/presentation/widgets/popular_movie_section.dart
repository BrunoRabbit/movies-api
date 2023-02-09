import 'package:flutter/material.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/features/home_page/presentation/widgets/build_configurate_api.dart';

class PopularMovieSection extends StatelessWidget {
  const PopularMovieSection({
    Key? key,
  }) : super(key: key);

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
    );
  }
}
