


import 'package:tmdb_app/domain/repositories/movie_repository.dart';

import '../entities/movie.dart';

interface class MovieUsecase {
  final MovieRepository movieRepository;

  MovieUsecase({required this.movieRepository});

  Future<List<Movie>> call() async {
    return await movieRepository.getMovies();
  }
}