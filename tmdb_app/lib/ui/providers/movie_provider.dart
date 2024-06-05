import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_app/domain/usecases/movies/get_favorite_movies.dart';
import 'package:tmdb_app/ui/providers/movie/movie_notifier.dart';

import '../../data/database/movie_database.dart';
import '../../data/datasource/movie_datasource.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/movies/get_movies.dart';
import '../../domain/usecases/movies/movie_usecase.dart';
import '../../domain/usecases/movies/set_favorite_movie.dart';

final movieDataSourceProvider = Provider<MovieDatasource>(
  (ref) => MovieDatasource(),
);

final movieDataBaseProvider = Provider<MovieDatabase>(
  (ref) => MovieDatabase(),
);

final movieRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
  final movieDataSource = ref.watch(movieDataSourceProvider);
  final movieDataBase = ref.watch(movieDataBaseProvider);
  return MovieRepositoryImpl(
      datasource: movieDataSource, database: movieDataBase);
});

final getMoviesUseCaseProvider = Provider<GetMovies>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetMovies(movieRepository: repository);
});

final setFavoriteUseCaseProvider = Provider<SetFavoriteMovie>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return SetFavoriteMovie(movieRepository: repository);
});

final getFavoriteMoviesUseCaseProvider = Provider<GetFavoriteMovies>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetFavoriteMovies(movieRepository: repository);
});

final movieProvider = AsyncNotifierProvider<MovieNotifier, MovieState>(() {
    return MovieNotifier();
});
