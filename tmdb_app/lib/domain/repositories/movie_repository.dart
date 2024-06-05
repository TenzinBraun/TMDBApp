import '../entities/movie.dart';

/// An abstract class that represents all the [UseCase]
/// of the [Movie] feature.
///
/// See also
///   - [getMovies] method.
///   - [setMovieAsFavorite] method.
abstract class MovieRepository {

  /// A method that retrieve a list of [Movie]
  /// @params: empty
  /// @return: return a [Future] that exposes a [List] of [Movie]
  Future<List<Movie>> getMovies();

  /// A method that set a [Movie] as favorite
  /// @params: [movie],  the [Movie] selected
  /// @return: return a [Future] void
  Future<void> setMovieAsFavorite(Movie movie);
}
