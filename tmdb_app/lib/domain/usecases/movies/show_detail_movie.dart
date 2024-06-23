import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb_app/domain/repositories/movie_repository.dart';
import 'package:tmdb_app/domain/usecases/use_case.dart';

import '../../../data/repositories/movie_repository_impl.dart';
import '../../../ui/providers/movie/movie_provider.dart';
import '../../entities/movie.dart';

part 'show_detail_movie.g.dart';

@riverpod
ShowDetailMovie showDetailMovie(ShowDetailMovieRef ref){
  return ShowDetailMovie(movieRepository: ref.watch(movieRepositoryImplProvider));
}


class ShowDetailMovie extends UseCase<Movie, Movie> {
  final MovieRepository movieRepository;

  ShowDetailMovie({required this.movieRepository});

  @override
  Future<Movie> call(Movie params) async {
    return await movieRepository.getMovieDetail(params);
  }
}
