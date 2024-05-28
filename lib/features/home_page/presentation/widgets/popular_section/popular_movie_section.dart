import 'package:flutter/material.dart';
import 'package:movies_api/core/models/device.dart';
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
  late double sectionHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final size = MediaQuery.sizeOf(context);

    sectionHeight = !Device.isWeb
        ? context.getSize(size.width / 2, size.height * 0.43)
        : 250;
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
            height: sectionHeight,
            child: const BuildConfigurateApi(),
          ),
        ],
      ),
    );
  }
}
