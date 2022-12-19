import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:movies_api/core/utils/graphql_service.dart';
import 'service_locator.dart' as di;
import 'package:movies_api/features/home_page/presentation/bloc/configurate_api_bloc/configurate_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/popular_api_bloc/popular_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/bloc/trending_api_bloc/trending_api_bloc.dart';
import 'package:movies_api/features/home_page/presentation/pages/home_page.dart';
import 'package:movies_api/core/themes/app_themes.dart';
import 'package:movies_api/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await di.setupLocator();

  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

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
        builder: (context, child) => GraphQLProvider(
          client: GraphqlService.graphClient,
          child: HomePage(context),
        ),
      ),
    );
  }
}
