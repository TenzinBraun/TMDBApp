part of 'home_screen.dart';


class FavoriteWidgetConsumer extends ConsumerWidget {
  const FavoriteWidgetConsumer(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieListNotifier = ref.watch(movieListProvider.notifier);

    return IconButton(
      onPressed: () async {
        await movieListNotifier.setFavorite(movie);
      },
      icon: Icon(
        movie.isFavorite
            ? Icons.favorite_rounded
            : Icons.favorite_border_rounded,
      ),
    );
  }
}
