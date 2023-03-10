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

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isVisible = false;
  final _controller = TextEditingController();
  String? errorText;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  // * I envisioned this search screen as an aid to filtering.
  // * First the person searches for the movie and clicking on the filter icon,
  // * the available options for the filter appear

  // * i could make a dropdown button or something similar but
  // * i want to make my life difficult

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
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                                if (isVisible) {
                                  animationController.forward();
                                } else {
                                  animationController.reverse();
                                }
                              });
                            },
                            child: Text('filtro'),
                          ),
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
                                    primary: Theme.of(context)
                                        .buttonTheme
                                        .colorScheme!
                                        .background),
                                child: const Text("Procurar"),
                                onPressed: () {
                                  if (_controller.text.isNotEmpty) {
                                    errorText = null;
                                    BlocProvider.of<SearchApiBloc>(context).add(
                                      SearchQueryLoad(name: _controller.text, page: 1),
                                    );
                                  } else {
                                    setState(() {
                                      errorText =
                                          "Esse campo nao pode ser vazio";
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: animationController.value * 150,
                        child: Opacity(
                          opacity: animationController.value,
                          child: Container(
                            color: Colors.blue,
                          ),
                        ),
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
}
