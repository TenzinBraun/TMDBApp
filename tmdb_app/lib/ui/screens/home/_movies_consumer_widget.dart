part of 'home_screen.dart';


class MoviesConsumerWidget extends ConsumerWidget {
  const MoviesConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var movies = ref.watch(movieListProvider);
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
