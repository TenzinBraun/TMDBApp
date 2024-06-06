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

/// The class that represents the MovieBaseState.
abstract class MovieState {}

/// The initial MovieState when [MovieNotifier] is build for the first time.
class InitialMovieState extends MovieState {}

/// A state that exposes a list of [Movie].
/// See also
///  - [MovieNotifier.getMovies]
///  - [MovieNotifier.getFavoriteMovies]
/// for [LoadedMoviesState] usage.
class LoadedMoviesState extends MovieState {
  final List<Movie> movies;

  LoadedMoviesState({required this.movies});
}

/// The [Movie] notifier that use [MovieUseCase] to trigger event.
class MovieNotifier extends AsyncNotifier<MovieState> {

  /// The temporary list of [Movie] fetched by [getMovies].
  List<Movie> movies = [];

  /// The temporary list of favorite [Movie] fetched by [getFavoriteMovies].
  List<Movie> favoriteMovies = [];

  /// The [Movie] useCase.
  MovieUseCase get movieUseCase => ref.read(movieUseCaseProvider);

  @override
  FutureOr<MovieState> build() => InitialMovieState();

  /// call the [MovieUseCase] and update the state to [LoadedMoviesState]
  /// with a list of [Movie].
  FutureOr<void> getMovies() async {
    state = await AsyncValue.guard<LoadedMoviesState>(() async {
      movies = await movieUseCase.call<GetMovies, NoParams>(NoParams());
      return LoadedMoviesState(
        movies: movies,
      );
    });
  }

  /// call the [MovieUseCase] and update the state to [LoadedMoviesState]
  /// with a list of favorite [Movie].
  FutureOr<void> getFavoriteMovies() async {
    state = await AsyncValue.guard<LoadedMoviesState>(() async {
      favoriteMovies =
      await movieUseCase.call<GetFavoriteMovies, NoParams>(NoParams());
      return LoadedMoviesState(
        movies: favoriteMovies,
      );
    });
  }

  /// call the [MovieUseCase] and update the movie selected.
  ///
  /// Then update the state using the [fromRoute] parameters.
  ///
  /// @params:
  ///   - [movie] of [Movie] the movie selected.
  ///   - [fromRoute] of [String] the route from where the movie was selected.
  FutureOr<void> setFavorite(Movie movie, String fromRoute) async {
    await movieUseCase.call<SetFavoriteMovie, Movie>(movie);
    if (fromRoute == AppRouting.home) {
      await getMovies();
    } else {
      await getFavoriteMovies();
    }
  }
}
