import '../../data/model/movie/movie_model.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  factory Movie.copyWith(MovieModel copy) => Movie(
        id: copy.id,
        title: copy.title,
        overview: copy.overview,
        posterPath: copy.posterPath,
      );
}
