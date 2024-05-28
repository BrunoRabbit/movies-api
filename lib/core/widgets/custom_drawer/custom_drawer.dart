import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/text_extensions.dart';

import 'package:movies_api/core/widgets/custom_drawer/custom_drawer_cubit.dart';
import 'package:movies_api/core/widgets/custom_drawer/custom_drawer_cubit_state.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
                    FadeInLeft(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: const RoundedIconButton(
                        Icons.home_rounded,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 550),
                      curve: Curves.easeInOut,
                      child: const RoundedIconButton(
                        Icons.search_rounded,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                      child: const RoundedIconButton(
                        Icons.settings_rounded,
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
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Titulo',
                                style: TextThemes.headline3.semiBold,
                              ),
                            ),
                          ),
                          FadeInLeft(
                            duration: const Duration(milliseconds: 550),
                            curve: Curves.easeInOut,
                            child: StadiumButton(
                              Icons.home_rounded,
                              'Início',
                              isOpen: state.isOpen,
                            ),
                          ),
                          FadeInLeft(
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 600),
                            child: StadiumButton(
                              Icons.search_rounded,
                              'Buscar',
                              isOpen: state.isOpen,
                            ),
                          ),
                          FadeInLeft(
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 650),
                            child: StadiumButton(
                              Icons.settings_rounded,
                              'Configurações',
                              isOpen: state.isOpen,
                            ),
                          ),
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
  const StadiumButton(this.iconData, this.text, {this.isOpen, super.key});

  final IconData iconData;
  final String text;
  final bool? isOpen;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
