import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_app/ui/screens/home/___movie_item_holder.dart';

import '../../providers/movie_provider.dart';

class FavoriteMovieConsumer extends ConsumerWidget {
  const FavoriteMovieConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(favoriteMoviesProvider);

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => MovieItemHolder(movie: movies[index]),
            childCount: movies.length,
          ),
        )
      ],
    );
  }
}
