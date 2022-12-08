import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/business_logic/blocs/configurate_api_bloc/configurate_api_bloc.dart';

import 'package:movies_api/business_logic/blocs/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/business_logic/blocs/trending_api_bloc/trending_api_bloc.dart';
import 'package:movies_api/presentation/widgets/body_home_page.dart';
import 'package:movies_api/presentation/widgets/gradient_scaffold.dart';

class HomePage extends StatefulWidget {
  final BuildContext context;

  const HomePage(
    this.context, {
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getConfigurateApi();
    getPopularApi();
    getTrendingApi();
  }

  void getConfigurateApi() {
    BlocProvider.of<ConfigurateApiBloc>(context).add(ConfigurateApiLoad());
  }

  void getPopularApi() {
    BlocProvider.of<PopularApiBloc>(context).add(PopularApiLoad());
  }

  void getTrendingApi() {
    BlocProvider.of<TrendingApiBloc>(context).add(TrendingApiLoad());
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: BlocBuilder<PopularApiBloc, PopularApiState>(
        builder: (context, state) {
          if (state is PopularApiLoaded) {
            return BodyHomePage(
              state: state,
            );
          }

          if (state is PopularApiError) {
            return Text("error: " + state.error);
          }
          return const Center(
            child: LinearProgressIndicator(),
          );
        },
      ),
    );
  }
}
