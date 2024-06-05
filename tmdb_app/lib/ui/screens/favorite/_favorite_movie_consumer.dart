part of 'favorite_screen.dart';

class FavoriteMovieConsumer extends ConsumerWidget {
  const FavoriteMovieConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(movieProvider.notifier).getFavoriteMovies();

    return AsyncNotifierBuilder(
        provider: movieProvider,
        builder: (context, state) {
          if (state is LoadedMoviesState) {
            if (state.movies.isEmpty) {
              return const Center(
                child: Text(
                    "Vous pouvez enregistrer les films qui vous plaisent depuis l'onglet 'Films'", textAlign: TextAlign.center,),
              );
            }
            return LoadedMovies(
                movies: state.movies, fromRoute: AppRouting.favorite);
          }
          return const SizedBox();
        });
  }
}
