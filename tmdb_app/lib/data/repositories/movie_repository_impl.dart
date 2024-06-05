import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasource/base_datasource.dart';
import '../model/movie/movie_model.dart';

/// The implementation of the [MovieRepository]
///
/// Handle the UI related logic and dispatch external logic through [BaseDatasource]
///
/// See also
///  - [datasource] properties.
///  - [movies] properties.
///  - [getMovies] method.
///  - [setMovieAsFavorite] method.
class MovieRepositoryImpl implements MovieRepository {
  /// the datasource that handles API logic.
  final BaseDatasource datasource;

  /// A list of [Movie] that represents the current referenced data processed by the App
  List<Movie> movies = [];

  MovieRepositoryImpl({required this.datasource});

  /// A method that get movies from the [datasource]
  /// and normalize api models to app entities.
  ///
  /// Stores the normalized object inside [movies]
  ///
  /// @params: empty.
  /// @return: a [Future] list of [Movie].
  ///
  /// See also
  ///  - [BaseDatasource.fetchMovies] method.
  ///  - [Movie.copyWith] method.
  @override
  Future<List<Movie>> getMovies() async {
    if (movies.isEmpty) {
      final List<MovieModel> movieModels = await datasource.fetchMovies();
      movies = movieModels
          .map((e) => Movie(
              id: e.id,
              title: e.title,
              overview: e.overview,
              posterPath: e.posterPath))
          .toList();
    }
    return movies;
  }

  /// A method that set a movie as favorite.
  ///
  /// Find the [index] of the [movie] marked as favorite.
  /// Update the [movies] at [index] with [Movie.isFavorite] as its opposite
  ///
  /// @params: a [movie] of [Movie].
  /// @return: a [Future].
  ///
  /// See also
  ///  - [Movie.copyWith] method.
  @override
  Future<void> setMovieAsFavorite(Movie movie) async {
    final index = movies.indexWhere((m) => m.id == movie.id);
    if (index != -1) {
      movies[index] = movies[index].copyWith(isFavorite: !movie.isFavorite);
    }
  }
}
