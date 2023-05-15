// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return SafeArea(
      child: BlocBuilder<SearchApiBloc, SearchApiState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                BlocBuilder<HistoryMovieCubit, List<String>>(
                  builder: (context, listHistory) {
                    return Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ? Title
                          const Text('Busque por filme, series ou pessoas'),
                          const SizedBox(
                            height: 10,
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
                                  hintText: "Digite aqui",
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
                                  height: 48,
                                  width: 150,
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
                        ],
                      ),
                    );
                  },
                ),
                state is! SearchApiInitial
                    ? Expanded(
                        flex: 2,
                        child: SearchSection(state, _controller.text),
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
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
