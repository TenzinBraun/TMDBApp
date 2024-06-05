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
///  - [update] method.
class MovieRepositoryImpl extends MovieRepository {
  /// A list of [Movie] that represents the current referenced data processed by the App
  List<Movie> movies = [];

  /// A list of [Movie] that represents the favorite movies stored by the user
  List<Movie> favoriteMovies = [];

  MovieRepositoryImpl({required super.datasource, required super.database});

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
    List<MovieModel> favoriteMovieModels = [];
    try {
      favoriteMovieModels = await database.getMovies();
    } catch (_) {}
    if (movies.isEmpty) {
      final List<MovieModel> movieModels = await datasource.fetchMovies();
      movies = movieModels
          .map((e) => Movie(
              id: e.id,
              title: e.title,
              overview: e.overview,
              posterPath: e.posterPath,
              isFavorite:
                  favoriteMovieModels.where((fm) => e.id == fm.id).isNotEmpty))
          .toList();
      favoriteMovies = favoriteMovieModels
          .map(
            (e) => Movie(
              id: e.id,
              title: e.title,
              overview: e.overview,
              posterPath: e.posterPath,
              isFavorite: true,
            ),
          )
          .toList();
    } else {
      movies = movies
          .map((e) => Movie(
              id: e.id,
              title: e.title,
              overview: e.overview,
              posterPath: e.posterPath,
              isFavorite:
                  favoriteMovieModels.where((fm) => e.id == fm.id).isNotEmpty))
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
  Future<void> update(Movie movie) async {
    final MovieModel movieModel = MovieModel(
      id: movie.id,
      title: movie.title,
      overview: movie.overview,
      posterPath: movie.posterPath,
    );

    var favoriteMoviesStored = (await database.getMovies())
        .map((e) => Movie(
              id: e.id,
              title: e.title,
              overview: e.overview,
              posterPath: e.posterPath,
              isFavorite: true,
            ))
        .toList();

    final bool isMovieStored =
        favoriteMoviesStored.where((e) => e.id == movie.id).isNotEmpty;

    if (isMovieStored) {
      await database.remove(movieModel);
      return;
    }
    return await database.setMovie(movieModel);
  }

  @override
  Future<List<Movie>> getFavoriteMovies() async {
    return (await database.getMovies())
        .map((e) => Movie(
              id: e.id,
              title: e.title,
              overview: e.overview,
              posterPath: e.posterPath,
              isFavorite: true,
            ))
        .toList();
  }
}
