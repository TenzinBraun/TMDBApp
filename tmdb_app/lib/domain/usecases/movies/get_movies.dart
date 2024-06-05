
import '../../entities/movie.dart';
import '../../repositories/movie_repository.dart';
import '../use_case.dart';

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
