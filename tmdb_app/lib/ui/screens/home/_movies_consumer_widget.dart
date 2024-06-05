part of 'home_screen.dart';

class MoviesConsumerWidget extends ConsumerWidget {
  const MoviesConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var movies = ref.watch(movieListProvider);
    if (movies.isEmpty) {
      return const Center(
        child: Text(
          "Oups... Couldn't load movies\nCheck if your API_KEY is valid or filled in",
          textAlign: TextAlign.center,
        ),
      );
    }
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => MovieItemHolder(movie: movies[index]),
            childCount: movies.length,
          ),
        ),
      ],
    );
  }
}
