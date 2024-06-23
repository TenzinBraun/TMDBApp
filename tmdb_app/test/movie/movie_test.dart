import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_app/config/navigation/app_routing.dart';
import 'package:tmdb_app/data/database/movie_database.dart';
import 'package:tmdb_app/data/datasource/movie_datasource.dart';
import 'package:tmdb_app/data/model/movie/movie_model.dart';
import 'package:tmdb_app/data/repositories/movie_repository_impl.dart';
import 'package:tmdb_app/domain/entities/movie.dart';
import 'package:tmdb_app/ui/providers/movie/movie_notifier.dart';

class MockMovieRepository extends MovieRepositoryImpl with Mock {
  MockMovieRepository({required super.datasource, required super.database});
}

class MockDatabase extends MovieDatabase with Mock {
  MockDatabase({required super.prefs});
}

class MockSharedPreferences with Mock implements SharedPreferences {}

class MockDatasource extends MovieDatasource with Mock {}

class Listener<T> extends Mock {
  void call(T? previous, T value);
}

Listener<T> setUpListener<T>(
  ProviderContainer container,
  ProviderListenable<T> provider, {
  bool fireImmediately = true,
}) {
  final listener = Listener<T>();
  container.listen(provider, listener.call, fireImmediately: fireImmediately);
  return listener;
}

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  late MovieNotifier movieNotifier;
  late ProviderContainer container;
  late Listener listener;
  final MockSharedPreferences mockSharedPreferences = MockSharedPreferences();
  setUpAll(() {
    SharedPreferences.setMockInitialValues({"favorite_movie": []});

    container = ProviderContainer(overrides: [
      sharedPreferencesProvider.overrideWithValue(mockSharedPreferences),
    ]);
    registerFallbackValue(AsyncValue<MovieState>.data(InitialMovieState()));
    listener = setUpListener(container, movieNotifierProvider);

    movieNotifier = container.read(movieNotifierProvider.notifier);

    addTearDown(() {
      container.dispose();
      resetMocktailState();
    });
  });
  // A helper method to create a ProviderContainer that overrides the movieRepositoryImplProvider

  group("Group of the movie usecase", () {
    List<Movie> movies = [];

    test('initial state is AsyncData with empty list', () async {
      final captured = verify(() => listener(any(), captureAny())).captured;
      expect(captured.length, 1);
      expect((captured[0] as AsyncData<MovieState>).value,
          isA<InitialMovieState>());
    });

    test('test if api can fetch movies', () async {
      movieNotifier = container.read(movieNotifierProvider.notifier);

      await movieNotifier.getMovies();

      final captured = verify(() => listener(any(), captureAny())).captured;

      debugPrint(
          ((captured[0] as AsyncData<MovieState>).value as LoadedMoviesState)
              .movies
              .toString());

      expect(movieNotifier.state.value, isA<LoadedMoviesState>());
      expect((movieNotifier.state.value as LoadedMoviesState).movies.isNotEmpty,
          true);
      expect(
          (movieNotifier.state.value as LoadedMoviesState).movies.length, 10);
      movies =
          ((captured[0] as AsyncData<MovieState>).value as LoadedMoviesState)
              .movies;
    });

    test('test if a movie can be set to favorite', () async {
      movieNotifier = container.read(movieNotifierProvider.notifier);

      when(() => mockSharedPreferences.setStringList(any(), any()))
          .thenAnswer((_) async => true);

      when(() => mockSharedPreferences.getStringList(any())).thenAnswer((_) => [
            jsonEncode(MovieModel(
                    id: movies.first.id,
                    title: movies.first.title,
                    overview: movies.first.overview,
                    posterPath: movies.first.posterPath)
                .toJson())
          ]);

      await movieNotifier.setFavorite(movies.first, AppRouting.favorite);

      final captured = verify(() => listener(any(), captureAny())).captured;

      debugPrint(
          ((captured[0] as AsyncData<MovieState>).value as LoadedMoviesState)
              .movies
              .toString());

      expect(movieNotifier.state.value, isA<LoadedMoviesState>());
      expect((movieNotifier.state.value as LoadedMoviesState).movies.isNotEmpty,
          true);
      expect((movieNotifier.state.value as LoadedMoviesState).movies.length, 1);
      expect((movieNotifier.state.value as LoadedMoviesState).movies.first.id, movies.first.id);
    });
  });
}
