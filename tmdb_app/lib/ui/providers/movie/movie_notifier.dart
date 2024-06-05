import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/navigation/app_routing.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/movies/get_favorite_movies.dart';
import '../../../domain/usecases/movies/get_movies.dart';
import '../../../domain/usecases/movies/movie_use_case.dart';
import '../../../domain/usecases/movies/set_favorite_movie.dart';
import '../../../domain/usecases/use_case.dart';
import 'movie_provider.dart';

abstract class MovieState {}

class InitialMovieState extends MovieState {}

class LoadedMoviesState extends MovieState {
  final List<Movie> movies;

  LoadedMoviesState({required this.movies});
}

class MovieNotifier extends AsyncNotifier<MovieState> {
  List<Movie> movies = [];
  List<Movie> favoriteMovies = [];

  MovieUseCase get movieUseCase => ref.read(movieUseCaseProvider);

  @override
  FutureOr<MovieState> build() => InitialMovieState();

  FutureOr<void> getMovies() async {
    state = await AsyncValue.guard<LoadedMoviesState>(() async {
      movies = await movieUseCase.call<GetMovies, NoParams>(NoParams());
      return LoadedMoviesState(
        movies: movies,
      );
    });
  }

  FutureOr<void> getFavoriteMovies() async {
    state = await AsyncValue.guard<LoadedMoviesState>(() async {
      favoriteMovies =
          await movieUseCase.call<GetFavoriteMovies, NoParams>(NoParams());
      return LoadedMoviesState(
        movies: favoriteMovies,
      );
    });
  }

  FutureOr<void> setFavorite(Movie movie, String from) async {
    await movieUseCase.call<SetFavoriteMovie, Movie>(movie);
    if (from == AppRouting.home) {
      await getMovies();
    } else {
      await getFavoriteMovies();
    }
  }
}
