part of 'home_screen.dart';

class LoadedMovies extends StatelessWidget {
  const LoadedMovies({
    super.key,
    required this.movies,
    required this.fromRoute,
  });

  final List<Movie> movies;
  final String fromRoute;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => MovieItemHolder(
              movie: movies[index],
              fromRoute: fromRoute,
            ),
            childCount: movies.length,
          ),
        ),
      ],
    );
  }
}
