import 'package:flutter_bottom_tabs/src/screens/home/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';

double getHeight(context) => MediaQuery.of(context).size.height;

final routes = {
  BottomNavigationScreen.tag: (BuildContext context) =>
      BottomNavigationScreen(),
};
