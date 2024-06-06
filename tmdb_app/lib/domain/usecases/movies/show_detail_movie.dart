import 'package:tmdb_app/domain/repositories/movie/movie_repository.dart';
import 'package:tmdb_app/domain/usecases/use_case.dart';

import '../../entities/movie.dart';

class ShowDetailMovie implements UseCase<Movie, Movie> {
  final MovieRepository movieRepository;

  ShowDetailMovie({required this.movieRepository});

  @override
  Future<Movie> call(Movie params) async {
    return await movieRepository.getMovieDetail(params);
  }
}
