import 'package:flutter/material.dart';

import '../../ui/screens/home/home_screen.dart';

class AppRouting {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    return switch (routeSettings.name) {
      home => MaterialPageRoute(
          builder: (context) => const HomeScreen(), settings: routeSettings),
      _ => MaterialPageRoute(
          builder: (context) => const HomeScreen(), settings: routeSettings)
    };
  }

  static const String home = "/";
}
