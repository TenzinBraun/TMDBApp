part of 'home_screen.dart';

class FavoriteWidgetConsumer extends ConsumerWidget {
  const FavoriteWidgetConsumer(
      {super.key, required this.movie, required this.fromRoute});

  final Movie movie;
  final String fromRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        ref.read(movieProvider.notifier).setFavorite(movie, fromRoute);
      },
      icon: Icon(
        movie.isFavorite
            ? Icons.favorite_rounded
            : Icons.favorite_border_rounded,
      ),
    );
  }
}
