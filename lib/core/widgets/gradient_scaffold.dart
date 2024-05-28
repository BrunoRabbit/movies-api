import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({
    super.key,
    required this.body,
    this.bottomNavBar,
    this.gradient,
    this.drawer,
  });

  final Widget body;
  final BottomNavigationBar? bottomNavBar;
  final LinearGradient? gradient;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: drawer,
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
