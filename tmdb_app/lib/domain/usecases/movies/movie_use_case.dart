import 'dart:async';

import '../../entities/movie.dart';
import '../../repositories/movie_repository.dart';
import '../use_case.dart';
import 'get_favorite_movies.dart';
import 'get_movies.dart';
import 'set_favorite_movie.dart';

/// The handler of all [UseCase] implied with the [Movie] feature
class MovieUseCase {
  final MovieRepository repository;

  MovieUseCase({required this.repository});

  /// A temporary generic function to call the proper [UseCase] call function based
  /// on its type [T]
  ///
  @Deprecated(
      "Will be remove in the future as we shouldn't use constant patterns with type literals.")
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
