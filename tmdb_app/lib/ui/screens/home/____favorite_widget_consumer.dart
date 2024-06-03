import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';
import '../../providers/movie_provider.dart';

class FavoriteWidgetConsumer extends ConsumerWidget {
  const FavoriteWidgetConsumer(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieUseCases = ref.watch(movieUseCaseProvider);

    return IconButton(
      onPressed: () async {
        await movieUseCases.setFavoriteMovie(movie);
      },
      icon: movie.isFavorite
          ? const Icon(
              Icons.favorite_rounded,
            )
          : const Icon(
              Icons.favorite_border_rounded,
            ),
    );
  }
}
