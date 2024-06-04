import 'package:tmdb_app/domain/usecases/movies/movie_usecase.dart';

import '../../entities/movie.dart';
import '../../repositories/movie_repository.dart';

class SetFavoriteMovie implements UseCase<void, Movie> {
  final MovieRepository movieRepository;

  SetFavoriteMovie({required this.movieRepository});

  @override
  Future<void> call(Movie params) {
      return movieRepository.setMovieAsFavorite(params);
  }

}