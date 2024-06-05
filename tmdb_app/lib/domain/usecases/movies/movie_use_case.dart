import 'dart:async';

import '../../entities/movie.dart';
import '../../repositories/movie_repository.dart';
import '../use_case.dart';
import 'get_favorite_movies.dart';
import 'get_movies.dart';
import 'set_favorite_movie.dart';

class MovieUseCase {
  final MovieRepository repository;

  final List<UseCase> useCases;

  MovieUseCase({required this.repository})
      : useCases = [
          GetMovies(movieRepository: repository),
          SetFavoriteMovie(movieRepository: repository),
          GetFavoriteMovies(movieRepository: repository),
        ];

  Future<dynamic> call<T extends UseCase, P extends UseCaseParams>(
      P params) async {
    return switch (T) {
      GetMovies => GetMovies(movieRepository: repository)(NoParams()),
      GetFavoriteMovies =>
        GetFavoriteMovies(movieRepository: repository)(NoParams()),
      SetFavoriteMovie =>
        SetFavoriteMovie(movieRepository: repository)(params as Movie),
      _ => GetMovies(movieRepository: repository)(NoParams()),
    };
  }
}
