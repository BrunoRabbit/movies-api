import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/movies_in_theaters_section/build_movies_in_theaters_bloc.dart';

class MoviesTheatersSection extends StatelessWidget {
  const MoviesTheatersSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurateApiBloc, ConfigurateApiState>(
      builder: (context, confState) {
        if (confState is ConfigurateApiLoaded) {
          return BuildMoviesInTheatersBloc(confState);
        }

        return Container();
      },
    );
  }
}



