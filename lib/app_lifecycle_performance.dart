// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// * This code code only checks the response time of a part of the application
// * should verify the main.dart
class AppLifecyclePerformance {
  static final Stopwatch _stopwatch = Stopwatch();
  static int _count = 0;
  static double _average = 0;
  static double _total = 0;

  static measurePerformance(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _stopwatch.reset();
      _stopwatch.start();
      return;
    }
    if (state == AppLifecycleState.inactive) return;

    if (state == AppLifecycleState.paused) {
      double seconds = _stopwatch.elapsedMilliseconds / 1000;
      _stopwatch.stop();

      _total += seconds;
      _count++;
      _average = _total / _count;

      print("Time elapsed: $seconds seconds, ");
      print("Average time: $_average seconds, ");
      print('Count: $_count');
      return;
    }
    return;
  }
}
