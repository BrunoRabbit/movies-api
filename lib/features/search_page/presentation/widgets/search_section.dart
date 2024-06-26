import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/utils/extensions/url_helper.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/search_page/domain/entities/search_result.dart';
import 'package:movies_api/features/search_page/presentation/bloc/search_api_bloc/search_api_bloc.dart';
import 'package:movies_api/features/search_page/presentation/cubit/page_search_cubit.dart';
import 'package:movies_api/features/search_page/presentation/widgets/movie_item.dart';

class SearchSection extends StatefulWidget {
  final SearchApiState state;
  final String name;

  const SearchSection(this.state, this.name, {super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  String posterUrl = "";
  final cubit = PageSearchCubit();

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state is SearchApiLoaded) {
      return BlocBuilder<ConfigurateApiBloc, ConfigurateApiState>(
        builder: (context, confState) {
          if (confState is ConfigurateApiLoaded) {
            SearchResult searchResult =
                (widget.state as SearchApiLoaded).searchResult;

            return ListView.builder(
              shrinkWrap: true,
              itemCount: searchResult.totalResults! > 19
                  ? 20
                  : searchResult.totalResults,
              itemBuilder: (context, index) {
                posterUrl = _createPosterUrl(
                  confState,
                  searchResult,
                  index,
                );
            
                if (index == 19 && searchResult.totalResults! > 19) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextButton(
                          child: const Text('Anterior'),
                          onPressed: () {
                            if (cubit.state != 1) {
                              cubit.decrementIndex();
            
                              BlocProvider.of<SearchApiBloc>(context).add(
                                SearchQueryLoad(
                                  name: widget.name,
                                  page: cubit.state,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      TextButton(
                        child: const Text('Próxima'),
                        onPressed: () {
                          cubit.incrementIndex();
            
                          BlocProvider.of<SearchApiBloc>(context).add(
                            SearchQueryLoad(
                              name: widget.name,
                              page: cubit.state,
                            ),
                          );
                        },
                      ),
                    ],
                  );
                } else if (index < 20) {
                  return MovieItem(
                    posterUrl: posterUrl,
                    searchResult: searchResult,
                    index: index,
                  );
                }
                return Container();
              },
            );
          }

          return Container();
        },
      );
    }

    if (widget.state is SearchApiLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (widget.state is SearchApiError) {
      return const Center(
        child: Text('Algo deu errado com sua busca ou com os servidores'),
      );
    }
    return Container();
  }

  String _createPosterUrl(
      ConfigurateApiLoaded confState, SearchResult searchResult, int index) {
    String? _baseUrl = confState.config.images!.baseUrl;

    String? _posterSize = confState.config.images!.posterSizes![2];
    String? _posterPath = searchResult.results?[index].posterPath;

    return _baseUrl!.concatUrl(_posterSize, _posterPath ?? "");
  }
}
