import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/navigation/navigation_provider.dart';

class BottomAppBarWidget extends ConsumerWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final navigationState = ref.watch(navigationProvider);
    final navigationNotifier = ref.watch(navigationProvider.notifier);
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.movie),
          label: "Films",
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite),
          label: "Favoris",
        ),
      ],
      onDestinationSelected: (destination) {
        navigationNotifier.navigate(destination, (route) {
          Navigator.of(context).pushReplacementNamed(route);
        });
        // setState(() {});
      },
      selectedIndex: navigationState.index,
    );
  }
}
