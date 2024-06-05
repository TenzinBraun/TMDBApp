import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_app/domain/entities/movie.dart';
import 'package:tmdb_app/domain/usecases/movies/movie_usecase.dart';
import 'package:tmdb_app/ui/providers/movie_provider.dart';

import '../../../config/navigation/app_routing.dart';

abstract class MovieState {}

class InitialMovieState extends MovieState {}

class LoadedMoviesState extends MovieState {
  final List<Movie> movies;

  LoadedMoviesState({required this.movies});
}

class MovieNotifier extends AsyncNotifier<MovieState> {
  List<Movie> movies = [];
  List<Movie> favoriteMovies = [];

  @override
  FutureOr<MovieState> build() {
    return InitialMovieState();
  }

  FutureOr<void> getMovies() async {
    state = await AsyncValue.guard<LoadedMoviesState>(() async {
      movies = await ref.read(getMoviesUseCaseProvider)(NoParams());
      return LoadedMoviesState(
        movies: movies,
      );
    });
  }

  FutureOr<void> getFavoriteMovies() async {
    state = await AsyncValue.guard<LoadedMoviesState>(() async {
      favoriteMovies =
          await ref.read(getFavoriteMoviesUseCaseProvider)(NoParams());
      return LoadedMoviesState(
        movies: favoriteMovies,
      );
    });
  }

  FutureOr<void> setFavorite(Movie movie, String from) async {
    await ref.read(setFavoriteUseCaseProvider)(movie);
    if (from == AppRouting.home) {
      await getMovies();
    } else {
      await getFavoriteMovies();
    }
  }
}
