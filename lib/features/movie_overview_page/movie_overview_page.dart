import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/core/widgets/gradient_scaffold.dart';
import 'package:movies_api/core/widgets/theater_component.dart';
import 'package:movies_api/features/home_page/presentation/cubit/page_navigator_cubit/page_navigator_cubit.dart';

class MovieOverviewPage extends StatefulWidget {
  const MovieOverviewPage({
    super.key,
    required this.url,
    required this.title,
    required this.results,
    required this.rating,
    required this.releaseDate,
  });

  final String url;
  final String title;
  final dynamic results;
  final double rating;
  final String releaseDate;

  @override
  State<MovieOverviewPage> createState() => _MovieOverviewPageState();
}

class _MovieOverviewPageState extends State<MovieOverviewPage> {
  late PageController pageController;
  double? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.rating / 10;
  }

  @override
  Widget build(BuildContext context) {
    final isWebSize = SizeHelper.isWebSize(context);

    return BlocBuilder<PageNavigatorCubit, int>(
      builder: (context, pageIndex) {
        pageController = PageController(
          initialPage: pageIndex,
        );

        return GradientScaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    isWebSize
                        ? WebSize(
                            widget: widget,
                            value: _value,
                          )
                        : MobileSize(
                            widget: widget,
                            value: _value,
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MobileSize extends StatelessWidget {
  const MobileSize({
    super.key,
    required this.widget,
    required double? value,
  }) : _value = value;

  final MovieOverviewPage widget;
  final double? _value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        CachedNetworkImage(
          imageUrl: widget.url,
          height: MediaQuery.sizeOf(context).height - 200,
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextThemes.headline2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.results.overview!,
              style: TextThemes.headline3.regular,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Aprovação geral:",
              style: TextThemes.headline3.regular,
            ),
            const SizedBox(
              height: 10,
            ),
            CircleRating(
              value: _value,
              rating: widget.rating,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Data de lançamento: ",
                  style: TextThemes.headline3,
                ),
                Text(
                  widget.releaseDate.replaceAll('-', '/'),
                  style: TextThemes.headline3.regular,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class WebSize extends StatelessWidget {
  const WebSize({
    super.key,
    required this.widget,
    required double? value,
  }) : _value = value;

  final MovieOverviewPage widget;
  final double? _value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: widget.url,
          height: MediaQuery.sizeOf(context).height - 50,
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextThemes.headline2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.results.overview!,
                style: TextThemes.headline3.regular,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Aprovação geral:",
                style: TextThemes.headline3.regular,
              ),
              const SizedBox(
                height: 10,
              ),
              CircleRating(
                value: _value,
                rating: widget.rating,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Data de lançamento: ",
                    style: TextThemes.headline3,
                  ),
                  Text(
                    widget.releaseDate.replaceAll('-', '/'),
                    style: TextThemes.headline3.regular,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
