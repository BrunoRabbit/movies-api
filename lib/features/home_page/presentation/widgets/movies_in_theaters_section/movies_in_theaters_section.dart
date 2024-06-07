import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';

import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/movies_in_theaters_section/build_movies_in_theaters.dart';

class MoviesInTheatersSection extends StatefulWidget {
  const MoviesInTheatersSection({super.key});

  @override
  State<MoviesInTheatersSection> createState() =>
      _MoviesInTheatersSectionState();
}

class _MoviesInTheatersSectionState extends State<MoviesInTheatersSection> {
  late double sectionHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final isWeb = SizeHelper.isWebSize(context);

    sectionHeight = !isWeb ? context.getSizeOrientation(350, 350) : 350;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurateApiBloc, ConfigurateApiState>(
      builder: (context, confState) {
        if (confState is ConfigurateApiLoaded) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, top: 24, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filmes em cartaz',
                  style: TextThemes.headline2.semiBold,
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: sectionHeight,
                  child: BuildMoviesInTheaters(confState),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
