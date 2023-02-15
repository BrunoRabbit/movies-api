
import 'package:flutter/material.dart';

extension SizeHelper on BuildContext {
  double getSize(double landscapeSize, double portraitSize) {
    final orientation = MediaQuery.of(this).orientation == Orientation.landscape;
    return orientation ? landscapeSize : portraitSize;
  }
}
