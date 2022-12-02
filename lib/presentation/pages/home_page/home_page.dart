import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_api/business_logic/blocs/popular_api_bloc/popular_api_bloc.dart';
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
    BlocProvider.of<PopularApiBloc>(context).add(PopularApiLoad());
    super.initState();
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
