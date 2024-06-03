import '../../entities/movie.dart';
import '../../repositories/movie_repository.dart';

class SetFavoriteMovie {
  final MovieRepository movieRepository;

  SetFavoriteMovie({required this.movieRepository});

  Future<Movie> call(Movie movie) async {
    return movieRepository.setMovieAsFavorite(movie);
  }

}