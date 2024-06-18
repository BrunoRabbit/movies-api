import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';
import 'package:movies_api/features/search_page/domain/entities/search_result.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.posterUrl,
    required this.searchResult,
    required this.index,
  });

  final String? posterUrl;
  final SearchResult searchResult;
  final int index;
  final String verifyUrl = "http://image.tmdb.org/t/p/w185";

  @override
  Widget build(BuildContext context) {
    final isWeb = SizeHelper.isWebSize(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            bottomLeft: Radius.circular(14),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              blurRadius: 4,
            ),
          ],
        ),
        height: !isWeb ? context.getSizeOrientation(200, 200) : 250,
        child: Row(
          children: [
            // ! Image
            // ? checking if the poster is null
            posterUrl != verifyUrl
                ? Flexible(
                    child: CachedNetworkImage(
                      imageUrl: posterUrl!,
                      color: Colors.transparent,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            bottomLeft: Radius.circular(14),
                          ),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: isWeb ? BoxFit.cover : BoxFit.fill,
                          ),
                        ),
                      ),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
                        return const Center(
                          child: GradientCircularProgress(),
                        );
                      },
                      placeholderFadeInDuration:
                          const Duration(milliseconds: 600),
                    ),
                  )
                : Flexible(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffDBDBDB),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          bottomLeft: Radius.circular(14),
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/no_found_image.svg',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: const Color(0xffB5B5B5),
                        ),
                      ),
                    ),
                  ),

            // ! description section(title, date and info)
            Expanded(
              flex: isWeb ? 5 : 2,
              child: Container(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            searchResult.results![index].overview != ""
                                ? Container()
                                : const Spacer(),

                            // ! title
                            Flexible(
                              child: Text(
                                searchResult.results![index].title!,
                                style: TextThemes.subtitle1.semiBold
                                    .copyWith(color: Colors.black87),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            // ! date
                            Text(
                              searchResult.results![index].releaseDate!.isEmpty
                                  ? "To Be Announced"
                                  : _convertStringToDateTime(searchResult
                                      .results![index].releaseDate!),
                              style: TextThemes.subtitle1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            // ! description
                            searchResult.results![index].overview != null
                                ? Expanded(
                                    flex: 2,
                                    child: Text(
                                      searchResult.results![index].overview!,
                                      style: TextThemes.subtitle1.semiBold
                                          .copyWith(color: Colors.black87),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 4,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _convertStringToDateTime(String releaseDate) {
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(releaseDate);

    initializeDateFormatting('pt_BR', null);

    return DateFormat.yMMMMd('pt_BR').format(dateTime);
  }
}
