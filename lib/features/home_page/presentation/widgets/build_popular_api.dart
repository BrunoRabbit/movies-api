
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/list_view_popular_images.dart';

class BuildPopularApi extends StatelessWidget {
  final ConfigurateApiLoaded confState;

  const BuildPopularApi({
    Key? key,
    required this.confState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularApiBloc, PopularApiState>(
      builder: (context, popularState) {
        if (popularState is PopularApiLoaded) {
          return Expanded(
            child: ListViewPopularImages(
              confState: confState,
              popularState: popularState,
            ),
          );
        }
        return Container();
      },
    );
  }
}
