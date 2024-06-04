import 'package:tmdb_app/data/model/movie/movie_model.dart';
import 'package:tmdb_app/domain/repositories/movie_repository.dart';

import '../../domain/entities/movie.dart';
import '../datasource/movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource movieDatasource;
  List<Movie> movies = [];

  MovieRepositoryImpl({required this.movieDatasource});

  @override
  Future<List<Movie>> getMovies() async {
    if (movies.isEmpty) {
      final List<MovieModel> movieModels = await movieDatasource.fetchMovies();
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

  @override
  Future<void> setMovieAsFavorite(Movie movie) async {
    final index = movies.indexWhere((m) => m.id == movie.id);
    if (index != -1) {
      movies[index] = movies[index].copyWith(isFavorite: !movie.isFavorite);
    }
  }
}
