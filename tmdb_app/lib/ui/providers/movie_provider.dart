import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/movie_datasource.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/movies/movie_usecase.dart';

final movieDataSourceProvider = Provider<MovieDatasource>(
  (ref) => MovieDatasource(),
);

final movieRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
  final movieDataSource = ref.watch(movieDataSourceProvider);
  return MovieRepositoryImpl(movieDatasource: movieDataSource);
});

final movieUseCaseProvider = Provider<MovieUseCase>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieUseCase(
    movieRepository: movieRepository,
  );
});
final movieListProvider = FutureProvider<List<Movie>>((ref) async {
  final useCases = ref.watch(movieUseCaseProvider);
  return await useCases.getMovies();
});

