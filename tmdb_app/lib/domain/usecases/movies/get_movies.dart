import 'package:tmdb_app/domain/usecases/movies/movie_usecase.dart';

import '../../entities/movie.dart';
import '../../repositories/movie_repository.dart';

class GetMovies implements UseCase<List<Movie>, NoParams> {
  final MovieRepository movieRepository;

  GetMovies({required this.movieRepository});

  @override
  Future<List<Movie>> call(NoParams params) async {
    return await movieRepository.getMovies();
  }
}
