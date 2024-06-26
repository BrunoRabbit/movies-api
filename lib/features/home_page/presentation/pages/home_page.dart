import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/utils/api_service.dart';
import 'package:movies_api/core/utils/extensions/size_helper.dart';
import 'package:movies_api/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';
import 'package:movies_api/core/widgets/gradient_scaffold.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/cubit/page_navigator_cubit/page_navigator_cubit.dart';
import 'package:movies_api/features/home_page/presentation/widgets/body_home_page.dart';
import 'package:movies_api/features/search_page/presentation/pages/search_page.dart';
import 'package:movies_api/features/settings_page/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    ApiService.loadAllApis(context);
    pageController = PageController(
      initialPage: context.read<PageNavigatorCubit>().state,
    );
  }

  List<Widget> pages = [
    //! Home page
    BlocBuilder<PopularApiBloc, PopularApiState>(
      builder: (context, state) {
        if (state is PopularApiLoaded) {
          return const BodyHomePage();
        }
        if (state is PopularApiLoading) {
          return const Center(
            child: GradientCircularProgress(),
          );
        }
        if (state is PopularApiError) {
          return Text("error: " + state.error);
        }
        return Container();
      },
    ),
    // ! Search page
    const SearchPage(),

    // ! Settings page
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isWebSize = SizeHelper.isWebSize(context);

    return BlocBuilder<PageNavigatorCubit, int>(
      builder: (context, pageIndex) {
        return GradientScaffold(
          body: Row(
            children: [
              !isWebSize
                  ? const SizedBox()
                  : CustomDrawer(
                      pageController: pageController,
                    ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    BlocProvider.of<PageNavigatorCubit>(context)
                        .changePage(index);
                  },
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                ),
              ),
            ],
          ),
          bottomNavBar: isWebSize
              ? null
              : BottomNavigationBar(
                  onTap: (index) {
                    BlocProvider.of<PageNavigatorCubit>(context)
                        .changePage(index);
                    pageController.animateToPage(
                      index,
                      curve: Curves.linear,
                      duration: const Duration(milliseconds: 150),
                    );
                  },
                  currentIndex: pageController.hasClients
                      ? pageController.page!.toInt()
                      : pageController.initialPage,
                  items: const [
                    BottomNavigationBarItem(
                      label: "",
                      icon: Icon(Icons.home_rounded),
                    ),
                    BottomNavigationBarItem(
                      label: "",
                      icon: Icon(Icons.search_rounded),
                    ),
                    BottomNavigationBarItem(
                      label: "",
                      icon: Icon(Icons.settings_rounded),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
