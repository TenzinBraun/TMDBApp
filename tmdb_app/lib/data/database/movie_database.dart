import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_app/data/database/base_database.dart';

import '../model/movie/movie_model.dart';

part 'movie_database.g.dart';

@riverpod
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

@riverpod
MovieDatabase movieDatabase(MovieDatabaseRef ref) {
  return MovieDatabase(prefs: ref.watch(sharedPreferencesProvider));
}

class MovieDatabase extends BaseDatabase {
  MovieDatabase({required this.prefs});

  @override
  String get featuredKey => "favorite_movie";

  final SharedPreferences prefs;

  @override
  Future<List<MovieModel>> getMovies() async {
    final favoriteMovies = prefs.getStringList(featuredKey);
    if (favoriteMovies != null) {
      return favoriteMovies.map((fm) {
        var test = jsonDecode(fm) as Map<String, dynamic>;
        return MovieModel.fromJson(test);
      }).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> setMovie(MovieModel movie) async {
    final favoriteMovies = prefs.getStringList(featuredKey);
    if (favoriteMovies == null) {
      try {
        await prefs.setStringList(featuredKey, [jsonEncode(movie.toJson())]);
      } catch (e) {
       print(e);
      }
      return;
    }
    await prefs.setStringList(
      featuredKey,
      favoriteMovies..add(jsonEncode(movie.toJson())),
    );
  }

  @override
  Future<void> setMovies(List<MovieModel> movies) async {
    await prefs.setStringList(
        featuredKey, movies.map((e) => jsonEncode(e.toJson())).toList());
  }

  @override
  Future<void> removeItem(MovieModel movie) async {
    final favoritesMovies = await getMovies();
    if (favoritesMovies.isEmpty) return;
    setMovies(favoritesMovies..removeWhere((e) => e.id == movie.id));
  }
}
