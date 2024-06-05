part of 'home_screen.dart';

class MoviesConsumerWidget extends ConsumerWidget {
  const MoviesConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(movieProvider.notifier).getMovies();
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
          return LoadedMovies(movies: state.movies, fromRoute: AppRouting.home);
        }
        return const SizedBox();
      },
    );
  }
}
