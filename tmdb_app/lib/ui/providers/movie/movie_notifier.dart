import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb_app/domain/usecases/movies/get_favorite_movies.dart';
import 'package:tmdb_app/domain/usecases/movies/get_movies.dart';
import 'package:tmdb_app/domain/usecases/movies/show_detail_movie.dart';

import '../../../config/navigation/app_routing.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/movies/set_favorite_movie.dart';
import '../../../domain/usecases/use_case.dart';

part 'movie_notifier.g.dart';

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

class ShowDetailState extends MovieState {
  final Movie movie;

  ShowDetailState({required this.movie});
}

/// The [Movie] notifier that use [MovieUseCase] to trigger event.
///
@riverpod
class MovieNotifier extends _$MovieNotifier {
  /// The temporary list of [Movie] fetched by [getMovies].
  List<Movie> movies = [];

  /// The temporary list of favorite [Movie] fetched by [getFavoriteMovies].
  List<Movie> favoriteMovies = [];
  String lastRoute = AppRouting.home;


  /// call the [MovieUseCase] and update the state to [LoadedMoviesState]
  /// with a list of [Movie].
  FutureOr<void> getMovies() async {
    state = await AsyncValue.guard<LoadedMoviesState>(
      () async {
        return LoadedMoviesState(
          movies: await ref.read(getMoviesProvider)(NoParams()),
        );
      },
    );
  }

  /// call the [MovieUseCase] and update the state to [LoadedMoviesState]
  /// with a list of favorite [Movie].
  FutureOr<void> getFavoriteMovies() async {
    state = await AsyncValue.guard<LoadedMoviesState>(() async {
      favoriteMovies = await ref.read(getFavoriteMoviesProvider)(NoParams());
      return LoadedMoviesState(
        movies: favoriteMovies,
      );
    });
  }

  /// Call the [MovieUseCase] and update the movie selected.
  ///
  /// Then update the state using the [fromRoute] parameters.
  ///
  /// @params:
  ///   - [movie] of [Movie] the movie selected.
  ///   - [fromRoute] of [String] the route from where the movie was selected.
  FutureOr<void> setFavorite(Movie movie, String fromRoute) async {
    await ref.read(setFavoriteMovieProvider)(movie);
    if (fromRoute == AppRouting.home) {
      await getMovies();
    } else {
      await getFavoriteMovies();
    }
  }

  /// Call the  call the [MovieUseCase] to get the detail of a [Movie].
  ///
  /// Stored the last [fromRoute] to ensure good pop back and state handle
  ///
  /// @params: [movie], [fromRoute]
  FutureOr<void> showDetailMovie(Movie movie, String fromRoute) async {
    lastRoute = fromRoute;
    state = await AsyncValue.guard<ShowDetailState>(() async {
      movie = await ref.read(showDetailMovieProvider)(movie);
      return ShowDetailState(movie: movie);
    });
  }

  /// Method invoke when back button is pressed.
  FutureOr<void> popBack() async {
    if (lastRoute == AppRouting.home) {
      await getMovies();
    } else {
      await getFavoriteMovies();
    }
  }

  @override
  FutureOr<MovieState> build() {
    return InitialMovieState();
  }
}


