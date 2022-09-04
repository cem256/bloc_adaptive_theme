import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/theme_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Adaptive Theme"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("System Default"),
                  value: ThemeMode.system,
                  groupValue: state.themeMode,
                  onChanged: (ThemeMode? theme) => context.read<ThemeBloc>().add(ThemeChanged(theme!)),
                ),
                RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Light"),
                  value: ThemeMode.light,
                  groupValue: state.themeMode,
                  onChanged: (ThemeMode? theme) => context.read<ThemeBloc>().add(ThemeChanged(theme!)),
                ),
                RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Dark"),
                  value: ThemeMode.dark,
                  groupValue: state.themeMode,
                  onChanged: (ThemeMode? theme) => context.read<ThemeBloc>().add(ThemeChanged(theme!)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
