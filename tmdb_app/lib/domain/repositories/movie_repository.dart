import '../../data/database/movie_database.dart';
import '../../data/datasource/movie_datasource.dart';
import '../entities/movie.dart';
import 'base_repository.dart';

/// An abstract class that represents all the [UseCase] logic
/// of the [Movie] feature.
///
/// Extends [BaseRepository] with [MovieDatasource] and [MovieDatabase]
///
/// See also
///   - [getMovies] method.
///   - [update] method.
abstract class MovieRepository
    extends BaseRepository<MovieDatasource, MovieDatabase> {
  MovieRepository({required super.datasource, required super.database});

  /// A method that retrieve a list of [Movie]
  /// @params: empty
  /// @return: return a [Future] that exposes a [List] of [Movie]
  Future<List<Movie>> getMovies();

  /// A method that retrieve a the favorite list of [Movie]
  /// @params: empty
  /// @return: return a [Future] that exposes a [List] of [Movie]
  Future<List<Movie>> getFavoriteMovies();

  /// A method that set a [Movie] as favorite
  /// @params: [movie],  the [Movie] selected
  /// @return: return a [Future] void
  Future<void> update(Movie movie);

  /// A method that return the detail of a [Movie] selected
  /// @params: [movie],  the [Movie] selected
  /// @return: return a [Future] of [Movie]
  Future<Movie> getMovieDetail(Movie params);

}
