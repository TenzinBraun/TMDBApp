import 'package:flutter/material.dart';
import 'package:tmdb_app/ui/screens/favorite/favorite_screen.dart';

import '../../ui/screens/home/home_screen.dart';

class AppRouting {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    return switch (routeSettings.name) {
      home => MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: routeSettings,
        ),
      favorite => MaterialPageRoute(
          builder: (context) => const FavoriteScreen(),
          settings: routeSettings,
        ),
      _ => MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: routeSettings,
        )
    };
  }

  static const String home = "/";
  static const String favorite = "/favorite";
}
