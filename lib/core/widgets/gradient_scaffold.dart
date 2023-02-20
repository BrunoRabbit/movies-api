// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;
  final BottomNavigationBar? bottomNavBar;
  final LinearGradient? gradient;

  const GradientScaffold({
    Key? key,
    required this.body,
    this.bottomNavBar,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: body,
          decoration: BoxDecoration(
            gradient: gradient ??
                LinearGradient(
                  colors: [
                    const Color(0xFF241F2B),
                    Colors.grey[800]!,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
          ),
        ),
        bottomNavigationBar: bottomNavBar,
      );
}
