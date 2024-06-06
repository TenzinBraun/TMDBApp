import 'dart:async';

import 'package:tmdb_app/domain/usecases/movies/show_detail_movie.dart';

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
          ShowDetailMovie(movieRepository: repository),
        ];

  Future<dynamic> call<T extends UseCase, P extends UseCaseParams>(
      P params) async {
    return switch (T) {
      GetMovies => GetMovies(movieRepository: repository)(params as NoParams),
      GetFavoriteMovies =>
        GetFavoriteMovies(movieRepository: repository)(params as NoParams),
      SetFavoriteMovie =>
        SetFavoriteMovie(movieRepository: repository)(params as Movie),
      ShowDetailMovie =>
          ShowDetailMovie(movieRepository: repository)(params as Movie),
      _ => GetMovies(movieRepository: repository)(NoParams()),
    };
  }
}
