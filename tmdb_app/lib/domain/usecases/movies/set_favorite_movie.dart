import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/movie_repository_impl.dart';
import '../../../ui/providers/movie/movie_provider.dart';
import '../../entities/movie.dart';
import '../../repositories/movie_repository.dart';
import '../use_case.dart';

part 'set_favorite_movie.g.dart';


@riverpod
SetFavoriteMovie setFavoriteMovie(SetFavoriteMovieRef ref){
  return SetFavoriteMovie(movieRepository: ref.watch(movieRepositoryImplProvider));
}

/// A class with the only purpose of setting a favorite movie
/// through [MovieRepository].
///
/// Implements [UseCase] with type void with [Movie] as params.
///
/// See also
///  - [movieRepository] properties
///  - [call] method
class SetFavoriteMovie implements UseCase<void, Movie> {

  /// the repository that manages the [Movie] feature.
  final MovieRepository movieRepository;

  SetFavoriteMovie({required this.movieRepository});

  /// Calls the [MovieRepository] to get a set a [Movie] as favorite.
  ///
  /// - @override [UseCase.call] abstract method.
  /// - @params: A [params] of type [Movie] that represents the favorite movie.
  /// - @return: A [Future] that completes with a void return.
  @override
  Future<void> call(Movie params) {
      return movieRepository.update(params);
  }
}