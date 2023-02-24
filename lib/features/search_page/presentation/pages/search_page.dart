// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/features/search_page/presentation/bloc/search_api_bloc/search_api_bloc.dart';
import 'package:movies_api/features/search_page/presentation/widgets/search_section.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
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
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Busque por filme, series ou pessoas'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          errorText: errorText,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          // hintText: hintText,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          child: const Text("Procurar"),
                          onPressed: () {
                            if (_controller.text.isNotEmpty) {
                              errorText = null;
                              BlocProvider.of<SearchApiBloc>(context).add(
                                SearchQueryLoad(name: _controller.text),
                              );
                            } else {
                              setState(() {
                                errorText = "Esse campo nao pode ser vazio";
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                state is! SearchApiInitial
                    ? Expanded(
                        flex: 2,
                        child: SearchSection(state),
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}
