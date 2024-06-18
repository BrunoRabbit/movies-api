import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/themes/text_themes.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/features/search_page/presentation/bloc/search_api_bloc/search_api_bloc.dart';
import 'package:movies_api/features/search_page/presentation/cubit/history_movie.dart';
import 'package:movies_api/features/search_page/presentation/widgets/autocomplete_style.dart';
import 'package:movies_api/features/search_page/presentation/widgets/search_section.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = TextEditingController();
  final historyCubit = HistoryMovieCubit();
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchApiBloc, SearchApiState>(
      builder: (context, state) {
        final isWebSize = SizeHelper.isWebSize(context);
    
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView(
            children: [
              BlocBuilder<HistoryMovieCubit, List<String>>(
                builder: (context, listHistory) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ? Title
                      Text(
                        'Milhões de Filmes, Séries e Pessoas para Descobrir. Explore já.',
                        style: isWebSize ? TextThemes.headline1 : null,
                      ),
              
                      SizedBox(
                        height: isWebSize ? 30 : 10,
                      ),
              
                      // ? Search
                      Autocomplete<String>(
                        optionsBuilder: (textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<String>.empty();
                          }
                          return listHistory.where(
                            (el) => el.contains(
                              textEditingValue.text,
                            ),
                          );
                        },
                        optionsViewBuilder: (context, onSelected, options) {
                          return AutocompleteStyle(
                            onSelected: onSelected,
                            options: options,
                            onRemove: onRemove,
                          );
                        },
                        fieldViewBuilder:
                            (context, controller, focusNode, __) {
                          _controller = controller;
                          return TextField(
                            focusNode: focusNode,
                            controller: controller,
                            decoration: InputDecoration(
                              errorText: errorText,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              hintText: isWebSize
                                  ? "Busque por filme, series ou pessoas"
                                  : "Digite aqui",
                            ),
                            onTapOutside: (event) {
                              if (focusNode.hasFocus) {
                                focusNode.unfocus();
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // ? Button
                      Row(
                        children: [
                          const Spacer(),
                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              height: 33,
                              width: 120,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  backgroundColor: Theme.of(context)
                                      .buttonTheme
                                      .colorScheme!
                                      .background,
                                ),
                                child: const Text("Procurar"),
                                onPressed: () => onButtonPressed(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
              state is! SearchApiInitial
                  ? SearchSection(state, _controller.text)
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  void onButtonPressed() {
    if (_controller.text.isNotEmpty) {
      errorText = null;
      BlocProvider.of<SearchApiBloc>(context).add(
        SearchQueryLoad(
          name: _controller.text,
          page: 1,
        ),
      );
      BlocProvider.of<HistoryMovieCubit>(context).addMovie(_controller.text);
    } else {
      setState(() {
        errorText = "Esse campo nao pode ser vazio";
      });
    }
  }

  void onRemove(String option) {
    BlocProvider.of<HistoryMovieCubit>(context).removeSuggestion(option);
  }
}
