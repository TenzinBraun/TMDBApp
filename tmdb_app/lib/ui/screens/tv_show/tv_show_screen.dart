import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/navigation/app_routing.dart';
import '../../providers/shared/shared_provider.dart';
import '../../widgets/async_notifier_builder.dart';
import '../home/home_screen.dart';

class TvShowConsumerWidget extends ConsumerWidget {
  const TvShowConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(movieProvider.notifier).getMovies<Series>();
    return AsyncNotifierBuilder<MovieNotifier, MovieState>(
      provider: movieProvider,
      builder: (context, state) {
        if (state is LoadedMoviesState) {
          if (state.movies.isEmpty) {
            return const Center(
              child: Text(
                "Oups... Couldn't load movies\nCheck if your API_KEY is valid or filled in",
                textAlign: TextAlign.center,
              ),
            );
          }
          return LoadedMovies(
            movies: state.movies,
            fromRoute: AppRouting.home,
          );
        }
        return const SizedBox();
      },
    );
  }
}
