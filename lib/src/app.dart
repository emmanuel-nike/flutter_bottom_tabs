import 'package:flutter_bottom_tabs/src/config/themes.dart';
import 'package:flutter_bottom_tabs/src/controllers/providers/settings_provider.dart';
import 'package:flutter_bottom_tabs/src/routes.dart';
import 'package:flutter_bottom_tabs/src/screens/home/bottom_navigation_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsProvider = ref.watch(settingsNotifierProvider);
    return MaterialApp(
      title: 'Flutter Bottom Tabs',
      theme: AppThemes.light(),
      darkTheme: AppThemes.dark(),
      themeMode: settingsProvider.themeMode,
      initialRoute: BottomNavigationScreen.tag,
      routes: routes,
      navigatorKey: navigatorKey,
    );
  }
}
