part of 'home_screen.dart';


class LoadedMovies extends StatelessWidget {
  const LoadedMovies({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
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
