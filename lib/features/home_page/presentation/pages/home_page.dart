import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/core/utils/api_service.dart';
import 'package:movies_api/core/widgets/gradient_circular_progress.dart';
import 'package:movies_api/core/widgets/gradient_scaffold.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/widgets/body_home_page.dart';

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
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            pageController.jumpToPage(index);
          });
        },
        children: [
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
          Text('data1'),

          // ! Settings page
          Text('data2'),
        ],
      ),
      bottomNavBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            pageController.jumpToPage(index);
          });
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
  }
}
