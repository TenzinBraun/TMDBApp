import '../../data/model/movie/movie_model.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  bool isFavorite;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    this.isFavorite = false,
  });

  factory Movie.copyWith(MovieModel copy) => Movie(
        id: copy.id,
        title: copy.title,
        overview: copy.overview,
        posterPath: copy.posterPath,
        isFavorite: false,
      );
}
