
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';

class PopularMoviesImages extends StatefulWidget {
  final double? rating;
  final String url;
  final String title;
  final String releaseDate;

  const PopularMoviesImages({
    Key? key,
    required this.rating,
    required this.url,
    required this.title,
    required this.releaseDate,
  }) : super(key: key);

  @override
  State<PopularMoviesImages> createState() => _PopularMoviesImagesState();
}

class _PopularMoviesImagesState extends State<PopularMoviesImages> {
  double? _value;
  late double _widthSizedBox;
  late double _heightSizedBox;
  late double _imageDetailsWidth;
  late double _ratingCirclePosition;

  @override
  void initState() {
    super.initState();
    _value = widget.rating! / 10;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _widthSizedBox = context.getSize(
      MediaQuery.of(context).size.width * 0.26,
      MediaQuery.of(context).size.width * 0.40,
    );
    _heightSizedBox = context.getSize(
      MediaQuery.of(context).size.width * 0.36,
      MediaQuery.of(context).size.height * 0.30,
    );
    _imageDetailsWidth = context.getSize(
      MediaQuery.of(context).size.width * 0.28,
      MediaQuery.of(context).size.width * 0.38,
    );
    _ratingCirclePosition = context.getSize(
      MediaQuery.of(context).size.width * 0.12,
      MediaQuery.of(context).size.width * 0.205,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24 / 2),
              child: SizedBox(
                width: _widthSizedBox,
                height: _heightSizedBox,
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.height / 4.2,
                  imageUrl: widget.url,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black87,
                          blurRadius: 4,
                        )
                      ],
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return const Center(
                      child: GradientCircularProgress(),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholderFadeInDuration: const Duration(milliseconds: 600),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: _imageDetailsWidth,
              child: Text(
                widget.title,
                style: TextThemes.body2.semiBold,
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: _imageDetailsWidth,
              child: Text(
                _convertStringToDateTime(),
                style: TextThemes.subtitle1,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Positioned(
          bottom: _ratingCirclePosition,
          left: 2,
          child: Stack(
            children: [
              CircularProgressIndicator(
                value: _value,
                backgroundColor: Colors.red[800],
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.green,
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                  color: Color(0xff1E1432),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.rating != null
                              ? (_value! * 100).toStringAsFixed(0)
                              : "NR",
                          style: TextThemes.subtitle2
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 5,
                      top: 4,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "%",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  String _convertStringToDateTime() {
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(widget.releaseDate);

    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}