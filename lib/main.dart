import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/theme_bloc.dart';
import 'presentation/home_screen.dart';
import 'utils/simple_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(const BlocAdaptiveTheme()),
    storage: storage,
    blocObserver: SimpleObserver(),
  );
}

class BlocAdaptiveTheme extends StatelessWidget {
  const BlocAdaptiveTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: "Bloc Adaptive Theme",
            debugShowCheckedModeBanner: false,

            //theme
            themeMode: state.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),

            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
