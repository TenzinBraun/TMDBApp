import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb_app/data/database/movie_database.dart';
import 'package:tmdb_app/data/datasource/movie_datasource.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasource/base_datasource.dart';
import '../model/movie/movie_model.dart';

part 'movie_repository_impl.g.dart';

@riverpod
MovieRepositoryImpl movieRepositoryImpl(MovieRepositoryImplRef ref) {
  return MovieRepositoryImpl(
    datasource: ref.watch(movieDatasourceProvider),
    database: ref.watch(movieDatabaseProvider),
  );
}

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

  /// A method that retrieve all the [Movie]
  ///
  /// Get all the [MovieModel] from [database]
  ///
  /// Check if local [movies] are empty.
  /// True: fetch the list of [MovieModel] from [datasource]
  /// normalize [MovieModel] to [Movie] with [Movie.isFavorite] to true
  /// when the current [MovieModel] processed from the [datasource] has a matching id
  /// in the [database].
  /// False:
  /// update [Movie.isFavorite] from [movies] from corresponding id in [database]
  ///
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
    } catch (e) {
      print("error $e");
    }
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
  /// Retrieve all the [Movie] from [database].
  /// Check if the movie is already stored
  /// True: delete the [Movie] as it implies the user unselected it
  /// False: Add the [Movie] in the database
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
      await database.removeItem(movieModel);
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

  /// A method that retrieve the detail of a [Movie]
  ///
  /// @params: a [Movie]
  /// @return: a Future of [Movie]
  @override
  Future<Movie> getMovieDetail(Movie params) async {
    var model = (await datasource.getMovieDetail(params));
    return Movie(
      id: model.id,
      title: model.title,
      overview: model.overview,
      posterPath: model.posterPath,
    );
  }
}
