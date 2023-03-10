import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/utils/extensions/url_helper.dart';
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/search_page/domain/entities/search_result.dart';
import 'package:movies_api/features/search_page/presentation/bloc/search_api_bloc/search_api_bloc.dart';
import 'package:movies_api/features/search_page/presentation/widgets/movie_item.dart';

class SearchSection extends StatefulWidget {
  final SearchApiState state;

  const SearchSection(this.state, {Key? key}) : super(key: key);

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  String posterUrl = "";

  @override
  Widget build(BuildContext context) {
    if (widget.state is SearchApiLoaded) {
      return BlocBuilder<ConfigurateApiBloc, ConfigurateApiState>(
        builder: (context, confState) {
          if (confState is ConfigurateApiLoaded) {
            SearchResult searchResult =
                (widget.state as SearchApiLoaded).searchResult;

            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: searchResult.totalResults! > 19
                  ? 20
                  : searchResult.totalResults,
              itemBuilder: (context, index) {
                posterUrl = _loadMovieItemsDetails(
                  confState,
                  searchResult,
                  index,
                );

                if (index == 19 && searchResult.totalResults! > 19) {
                  return ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: Theme.of(context)
                            .buttonTheme
                            .colorScheme!
                            .background),
                    child: const Text('Ver mais'),
                  );
                } else if (index < 20) {
                  // ! this is the component that shows the search result
                  // ? what happens to it is that instead of using Card + ListTile,
                  // ? I created my custom one without using them
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

  String _loadMovieItemsDetails(
      ConfigurateApiLoaded confState, SearchResult searchResult, int index) {
    String? _baseUrl = confState.config.images!.baseUrl;

    String? _posterSize = confState.config.images!.posterSizes![2];
    String? _posterPath = searchResult.results?[index].posterPath;

    return _baseUrl!.concatUrl(_posterSize, _posterPath ?? "");
  }
}
