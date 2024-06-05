part of 'favorite_screen.dart';

class FavoriteMovieConsumer extends ConsumerWidget {
  const FavoriteMovieConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(movieProvider.notifier).getFavoriteMovies();

    return AsyncNotifierBuilder(
        notifierProvider: movieProvider,
        builder: (context, state) {
          if (state is LoadedMoviesState) {
            return LoadedMovies(movies: state.movies, fromRoute: AppRouting.favorite);
          }
          return const SizedBox();
        });
  }
}
