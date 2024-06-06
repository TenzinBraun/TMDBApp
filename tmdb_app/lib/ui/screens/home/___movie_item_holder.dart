part of 'home_screen.dart';

class MovieItemHolder extends ConsumerWidget {
  const MovieItemHolder({
    super.key,
    required this.movie,
    required this.fromRoute,
  });

  final Movie movie;
  final String fromRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(movieProvider.notifier).showDetailMovie(movie, fromRoute);
        Navigator.of(context).pushNamed(AppRouting.detail);
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Image.network(
                "${AppClient.imageUrl}${movie.posterPath}",
                gaplessPlayback: true,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(movie.title)),
                        FavoriteWidgetConsumer(
                          movie: movie,
                          fromRoute: fromRoute,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        movie.overview.length > 225
                            ? "${movie.overview.substring(0, 225)}... voir plus"
                            : movie.overview,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
