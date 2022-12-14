import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_api/app/business_logic/blocs/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/app/business_logic/blocs/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/app/business_logic/blocs/trending_api_bloc/trending_api_bloc.dart';
import 'package:movies_api/app/ui/pages/home_page/home_page.dart';
import 'package:movies_api/core/themes/app_themes.dart';
import 'package:movies_api/service_locator.dart';

GetIt sl = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await setupLocator(sl);

  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

// api key =
// https://api.themoviedb.org/3/movie/550?api_key=9ac406a66ef45207fe6d7dc478792ca4
class _ApplicationState extends State<Application> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularApiBloc>(
          create: (_) => sl(),
        ),
        BlocProvider<ConfigurateApiBloc>(
          create: (_) => sl(),
        ),
        BlocProvider<TrendingApiBloc>(
          create: (_) => sl(),
        ),
      ],
      child: MaterialApp(
        theme: darkTheme,
        debugShowCheckedModeBanner: false,
        // home: HomePage(),
        builder: (context, child) => HomePage(context),
      ),
    );
  }
}
