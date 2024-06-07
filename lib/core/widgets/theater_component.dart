import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';

class TheaterComponent extends StatefulWidget {
  final double? rating;
  final String url;
  final String title;
  final String releaseDate;

  const TheaterComponent({
    super.key,
    required this.rating,
    required this.url,
    required this.title,
    required this.releaseDate,
  });

  @override
  State<TheaterComponent> createState() => _TheaterComponentState();
}

class _TheaterComponentState extends State<TheaterComponent> {
  double? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.rating! / 10;
  }

  @override
  Widget build(BuildContext context) {
    final isWebSize = SizeHelper.isWebSize(context);
    final isTabletSize = SizeHelper.isTabletSize(context);

    return SizedBox(
      width: 150,
      // width: isTabletSize
      //     ? MediaQuery.sizeOf(context).width * .20
      //     : isWebSize
      //         ? MediaQuery.sizeOf(context).width * .14
      //         : MediaQuery.sizeOf(context).width * .35,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.url,
                height: 225,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 4,
                      )
                    ],
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
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.title,
                style: TextThemes.body2.semiBold,
                textAlign: TextAlign.start,
              ),
              Text(
                _convertStringToDateTime(),
                style: TextThemes.subtitle1,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Positioned.fill(
            top: 210,
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
          ),
        ],
      ),
    );
  }

  String _convertStringToDateTime() {
    if (widget.releaseDate == "TBA") {
      return "To Be Announced";
    } else {
      DateTime dateTime = DateFormat('yyyy-MM-dd').parse(widget.releaseDate);

      return DateFormat('dd/MM/yyyy').format(dateTime);
    }
  }
}
