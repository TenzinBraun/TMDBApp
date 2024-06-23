import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb_app/data/repositories/movie_repository_impl.dart';

import '../../../ui/providers/movie/movie_provider.dart';
import '../../entities/movie.dart';
import '../../repositories/movie_repository.dart';
import '../use_case.dart';

part 'get_movies.g.dart';


@riverpod
GetMovies getMovies(GetMoviesRef ref){
  return GetMovies(movieRepository: ref.watch(movieRepositoryImplProvider));
}

/// A class with the only purpose of retrieving movies through [MovieRepository].
///
/// Implements [UseCase] with type [List] of [Movie] with [NoParams].
///
/// See also
///  - [movieRepository] properties
///  - [call] method
class GetMovies implements UseCase<List<Movie>, NoParams> {
  /// the repository that manages the [Movie] feature.
  final MovieRepository movieRepository;

  GetMovies({required this.movieRepository});

  /// Calls the [MovieRepository] to get a [List] of [Movie].
  ///
  /// - @override [UseCase.call] abstract method.
  /// - @params: A [params] of type [NoParams].
  /// - @return: A [Future] that completes with a [List] of [Movie].
  @override
  Future<List<Movie>> call(NoParams params) async {
    return await movieRepository.getMovies();
  }
}
