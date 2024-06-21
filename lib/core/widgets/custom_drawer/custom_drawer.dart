// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';
import 'package:movies_api/core/widgets/custom_drawer/custom_drawer_cubit.dart';
import 'package:movies_api/core/widgets/custom_drawer/custom_drawer_cubit_state.dart';
import 'package:movies_api/features/home_page/presentation/cubit/page_navigator_cubit/page_navigator_cubit.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int durationMiliseconds = 500;

  List<Map<String, dynamic>> get icons => [
        {
          "iconData": Icons.home_rounded,
          "duration": Duration(milliseconds: durationMiliseconds),
        },
        {
          "iconData": Icons.search_rounded,
          "duration": Duration(milliseconds: durationMiliseconds + 50),
        },
        {
          "iconData": Icons.settings_rounded,
          "duration": Duration(milliseconds: durationMiliseconds + 100),
        },
      ];

  List<Widget> drawerButtons(state) {
    int durationMilliseconds = 500;
    List<Widget> buttons = [
      StadiumButton(
        widget.pageController,
        0,
        Icons.home_rounded,
        'Início',
        isOpen: state.isOpen,
      ),
      StadiumButton(
        widget.pageController,
        1,
        Icons.search_rounded,
        'Buscar',
        isOpen: state.isOpen,
      ),
      StadiumButton(
        widget.pageController,
        2,
        Icons.settings_rounded,
        'Configurações',
        isOpen: state.isOpen,
      ),
    ];

    return buttons.map((e) {
      final widget = FadeInLeft(
        duration: Duration(milliseconds: durationMilliseconds),
        curve: Curves.easeInOut,
        child: e,
      );

      durationMilliseconds += 50;
      return widget;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomDrawerCubit, CustomDrawerCubitState>(
      builder: (context, state) {
        final isDrawerOpen = state.width == 100;

        return MouseRegion(
          onEnter: (event) {
            context.read<CustomDrawerCubit>().onEnterDrawer();
          },
          onExit: (event) {
            context.read<CustomDrawerCubit>().onExitDrawer();
          },
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 420),
            width: state.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF241F2B),
                  Colors.grey[800]!,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 420),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Column(
                key: ValueKey<bool>(isDrawerOpen),
                mainAxisAlignment: isDrawerOpen
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  if (isDrawerOpen) ...[
                    ...icons.map(
                      (icon) => Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: FadeInLeft(
                          duration: icon['duration'],
                          curve: Curves.easeInOut,
                          child: RoundedIconButton(
                            icon['iconData'],
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 12,
                      ),
                      child: Column(
                        children: [
                          FadeInLeft(
                            duration: Duration(
                              milliseconds: durationMiliseconds,
                            ),
                            curve: Curves.easeInOut,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Titulo',
                                style: TextThemes.headline3.semiBold,
                              ),
                            ),
                          ),
                          ...drawerButtons(state),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton(this.iconData, {super.key});

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFF241F2B).withOpacity(.5),
      child: IconButton(
        icon: Icon(
          iconData,
        ),
        disabledColor: Colors.white,
        onPressed: null,
      ),
    );
  }
}

class StadiumButton extends StatelessWidget {
  const StadiumButton(
    this.pageController,
    this.index,
    this.iconData,
    this.text, {
    this.isOpen,
    super.key,
  });

  final IconData iconData;
  final String text;
  final bool? isOpen;
  final int index;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pageController.animateToPage(
          index,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 150),
        );
        BlocProvider.of<PageNavigatorCubit>(context).changePage(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: const Color(0xFF241F2B).withOpacity(.5),
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(iconData),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: AnimatedOpacity(
                  opacity: isOpen ?? false ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 250),
                  child: FittedBox(
                    child: Text(
                      text,
                      style: TextThemes.subtitle1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
