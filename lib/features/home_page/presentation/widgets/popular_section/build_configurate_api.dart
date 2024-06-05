import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/popular_section/build_popular_api.dart';

class BuildConfigurateApi extends StatelessWidget {
  const BuildConfigurateApi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurateApiBloc, ConfigurateApiState>(
      builder: (context, confState) {
        if (confState is ConfigurateApiLoaded) {
          return BuildPopularApi(confState: confState);
        }
        return Container();
      },
    );
  }
}
