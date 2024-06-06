part of 'shared_provider.dart';

abstract class FeatureEvent {}

class Movies extends FeatureEvent {}

class Series extends FeatureEvent {}

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
class MovieNotifier extends AsyncNotifier<MovieState> {
  /// The temporary list of [Movie] fetched by [getMovies].
  List<Movie> movies = [];

  /// The temporary list of favorite [Movie] fetched by [getFavoriteMovies].
  List<Movie> favoriteMovies = [];
  String lastRoute = AppRouting.home;

  /// The [Movie] useCase.
  MovieUseCase get movieUseCase => ref.read(movieUseCaseProvider);

  TvShowUseCase get tvShowUseCase => ref.read(tvShowUseCaseProvider);

  @override
  FutureOr<MovieState> build() => InitialMovieState();

  /// call the [MovieUseCase] and update the state to [LoadedMoviesState]
  /// with a list of [Movie].
  FutureOr<void> getMovies<T extends FeatureEvent>() async {
    state = await AsyncValue.guard<LoadedMoviesState>(() async {
      if (T == Series) {
        movies = await tvShowUseCase.call<GetSeries, NoParams>(NoParams());
      } else if (T == Movies) {
        movies = await movieUseCase.call<GetMovies, NoParams>(NoParams());
      }else {
        movies = [];
      }
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

  /// Call the [MovieUseCase] and update the movie selected.
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

  /// Call the  call the [MovieUseCase] to get the detail of a [Movie].
  ///
  /// Stored the last [fromRoute] to ensure good pop back and state handle
  ///
  /// @params: [movie], [fromRoute]
  FutureOr<void> showDetailMovie(Movie movie, String fromRoute) async {
    lastRoute = fromRoute;
    state = await AsyncValue.guard<ShowDetailState>(() async {
      movie = await movieUseCase.call<ShowDetailMovie, Movie>(movie);
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
}
