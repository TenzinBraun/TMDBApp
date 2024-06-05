import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasource/movie_datasource.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/movies/get_movies.dart';
import '../../domain/usecases/movies/movie_usecase.dart';
import '../../domain/usecases/movies/set_favorite_movie.dart';

final movieDataSourceProvider = Provider<MovieDatasource>(
  (ref) => MovieDatasource(),
);

final movieRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
  final movieDataSource = ref.watch(movieDataSourceProvider);
  return MovieRepositoryImpl(datasource: movieDataSource);
});

final getMoviesUseCaseProvider = Provider<GetMovies>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetMovies(movieRepository: repository);
});

final setFavoriteUseCaseProvider = Provider<SetFavoriteMovie>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return SetFavoriteMovie(movieRepository: repository);
});

final movieListProvider =
    StateNotifierProvider<MovieListNotifier, List<Movie>>((ref) {
  final getMoviesUseCase = ref.watch(getMoviesUseCaseProvider);
  final setFavoriteUseCase = ref.watch(setFavoriteUseCaseProvider);
  return MovieListNotifier(getMoviesUseCase, setFavoriteUseCase);
});

final favoriteMoviesProvider = Provider<List<Movie>>((ref) {
  final movieList = ref.watch(movieListProvider);
  return movieList.where((movie) => movie.isFavorite).toList();
});

class MovieListNotifier extends StateNotifier<List<Movie>> {
  final GetMovies getMoviesUseCase;
  final SetFavoriteMovie setFavoriteMovie;

  MovieListNotifier(this.getMoviesUseCase, this.setFavoriteMovie) : super([]) {
    getMovies();
  }

  Future<void> getMovies() async {
    final movies = await getMoviesUseCase(NoParams());
    state = movies;
  }

  Future<void> setFavorite(Movie movie) async {
    state = [
      for (final m in state)
        if (m.id == movie.id) m.copyWith(isFavorite: !m.isFavorite) else m,
    ];
    await setFavoriteMovie(movie);
  }
}
