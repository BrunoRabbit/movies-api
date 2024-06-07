import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/upcoming_section/build_upcoming_api.dart';

class UpcomingSection extends StatelessWidget {
  const UpcomingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurateApiBloc, ConfigurateApiState>(
      builder: (context, confState) {
        if (confState is ConfigurateApiLoaded) {
          return BuildUpcomingApi(confState);
        }

        return Container();
      },
    );
  }
}
