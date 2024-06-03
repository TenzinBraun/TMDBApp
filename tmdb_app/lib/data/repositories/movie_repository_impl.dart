import '../datasource/movie_datasource.dart';
import '../model/movie/movie_model.dart';

class MovieRepositoryImpl {
  final MovieDatasource movieDatasource;

  MovieRepositoryImpl({required this.movieDatasource});


  Future<List<MovieModel>> getMovies() async {
    return await movieDatasource.fetchMovies();
  }
}