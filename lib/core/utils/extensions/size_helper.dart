import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension SizeHelper on BuildContext {
  static const isWeb = kIsWeb; // platform helper

  double getSizeOrientation(double landscapeSize, double portraitSize) {
    final orientation = MediaQuery.orientationOf(this) == Orientation.landscape;
    return orientation ? landscapeSize : portraitSize;
  }

  static bool isWebSize(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 600;
  }

  static bool isTabletSize(BuildContext context) {
    return isWebSize(context) && MediaQuery.sizeOf(context).width <= 1036;
  }
}
