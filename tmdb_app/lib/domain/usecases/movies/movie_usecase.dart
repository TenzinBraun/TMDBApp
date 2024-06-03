import 'package:tmdb_app/domain/repositories/movie_repository.dart';
import 'package:tmdb_app/domain/usecases/movies/get_movies.dart';
import 'package:tmdb_app/domain/usecases/movies/set_favorite_movie.dart';

final class MovieUseCase {
  final MovieRepository movieRepository;

  final GetMovies getMovies;
  final SetFavoriteMovie setFavoriteMovie;

  MovieUseCase({
    required this.movieRepository,
  }): getMovies = GetMovies(
          movieRepository: movieRepository,
        ),
        setFavoriteMovie = SetFavoriteMovie(
          movieRepository: movieRepository,
        )
  ;
}
