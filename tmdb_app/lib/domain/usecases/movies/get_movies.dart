
import '../../entities/movie.dart';
import '../../repositories/movie_repository.dart';


class GetMovies {
  final MovieRepository movieRepository;
  GetMovies({required this.movieRepository});

  Future<List<Movie>> call() async {
    return await movieRepository.getMovies();
  }
}