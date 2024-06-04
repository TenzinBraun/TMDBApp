import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_app/config/navigation/app_routing.dart';

class NavigationState {
  final int index;
  final String route;

  NavigationState(this.index, this.route);
}

class NavigationNotifier extends StateNotifier<NavigationState> {
  NavigationNotifier() : super(NavigationState(0, AppRouting.home));

  void navigate(int index, Function(String route) callback) {
    String route = index == 0 ? AppRouting.home : AppRouting.favorite;
    state = NavigationState(
        index, index == 0 ? AppRouting.home : AppRouting.favorite);
    callback(route);
  }
}

final navigationProvider =
    StateNotifierProvider<NavigationNotifier, NavigationState>((ref) {
  return NavigationNotifier();
});
