import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_api/register_blocs_cubits.dart';
import 'service_locator.dart' as di;
import 'package:movies_api/features/home_page/presentation/pages/home_page.dart';
import 'package:movies_api/core/themes/app_themes.dart';

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
      providers: RegisterBlocsCubits.registerBlocsCubits(),
      child: MaterialApp(
        theme: darkTheme,
        debugShowCheckedModeBanner: false,
        // home: HomePage(),
        builder: (context, child) => HomePage(context),
      ),
    );
  }
}
