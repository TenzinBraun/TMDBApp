import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/movie_provider.dart';
import '__loaded_movies.dart';

class MoviesConsumerWidget extends ConsumerWidget {
  const MoviesConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var test = ref.watch(movieListProvider);
    return ref.watch(movieListProvider).when(
          data: (event) => LoadedMovies(
            movies: event,
          ),
          error: (err, stackTrace) => const Center(
            child: Text("Oups something wrong happenend"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}


