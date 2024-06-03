import 'package:tmdb_app/data/model/movie/movie_model.dart';
import 'package:tmdb_app/domain/repositories/movie_repository.dart';

import '../../domain/entities/movie.dart';
import '../datasource/movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource movieDatasource;

  MovieRepositoryImpl({required this.movieDatasource});

  @override
  Future<List<Movie>> getMovies() async {
    final List<MovieModel> movieModels = await movieDatasource.fetchMovies();
    return movieModels.map((e) => Movie.copyWith(e)).toList();
  }
}
