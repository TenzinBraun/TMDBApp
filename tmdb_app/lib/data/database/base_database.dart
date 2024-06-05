import '../model/movie/movie_model.dart';

abstract class BaseDatabase {
  String get featuredKey;

  Future<List<MovieModel>> getMovies();

  Future<void> setMovie(MovieModel movie);
  Future<void> remove(MovieModel movie);
  Future<void> setMovies(List<MovieModel> movies);
}
