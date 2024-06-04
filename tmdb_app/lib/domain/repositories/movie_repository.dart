

import '../entities/movie.dart';

abstract interface class MovieRepository {

  Future<List<Movie>> getMovies();

  Future<void> setMovieAsFavorite(Movie movie);
}