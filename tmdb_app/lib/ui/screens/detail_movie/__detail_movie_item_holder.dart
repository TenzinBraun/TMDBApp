part of 'detail_screen.dart';

class DetailMovieItemHolder extends StatelessWidget {
  const DetailMovieItemHolder({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              "${AppClient.imageUrl}${movie.posterPath}",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(movie.title),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(movie.overview, textAlign: TextAlign.center, ),
            )
          ],
        ),
      ),
    );
  }
}
