part of 'favorite_screen.dart';

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
