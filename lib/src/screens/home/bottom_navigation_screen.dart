import 'dart:developer';
import 'package:flutter_bottom_tabs/src/controllers/providers/nav_provider.dart';
import 'package:flutter_bottom_tabs/src/screens/components/icons/chat_icon.dart';
import 'package:flutter_bottom_tabs/src/screens/components/icons/home_icon.dart';
import 'package:flutter_bottom_tabs/src/screens/components/icons/profile_icon.dart';
import 'package:flutter_bottom_tabs/src/screens/components/icons/trending_icon.dart';
import 'package:flutter_bottom_tabs/src/screens/home/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

enum BottomNavPages { home, neighbors, create, store, profile }

class BottomNavigationScreen extends ConsumerStatefulWidget {
  static String tag = '/home';

  const BottomNavigationScreen({super.key});

  @override
  BottomNavigationScreenState createState() => BottomNavigationScreenState();
}

class BottomNavigationScreenState
    extends ConsumerState<BottomNavigationScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  static final pages = <Widget>[
    HomeScreen(),
    Scaffold(),
    SizedBox(), //GMComposeScreen(), //SNMediaScreen(),
    Scaffold(), //SNSearchScreen(),
    Scaffold(),
  ];

  void onItemTapped(int index) {
    ref.read(bottomNavIndexProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);
    print('Selected Index: $selectedIndex');
    final theme = Theme.of(context);
    final inactiveIconColor =
        theme.bottomNavigationBarTheme.unselectedIconTheme?.color ??
        Colors.grey;
    final activeIconColor =
        theme.bottomNavigationBarTheme.selectedIconTheme?.color ?? Colors.white;
    return SafeArea(
      top: false,
      child: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0,
          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: HomeIcon(color: inactiveIconColor),
              activeIcon: HomeIcon(color: activeIconColor),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: TrendingIcon(color: inactiveIconColor),
              activeIcon: TrendingIcon(color: activeIconColor),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ChatIcon(color: inactiveIconColor),
              activeIcon: ChatIcon(color: activeIconColor),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ProfileIcon(color: inactiveIconColor),
              activeIcon: ProfileIcon(color: activeIconColor),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
