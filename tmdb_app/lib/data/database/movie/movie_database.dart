import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_app/data/database/base_database.dart';

import '../../model/movie/movie_model.dart';

class MovieDatabase extends BaseDatabase {
  @override
  String get featuredKey => "favorite_movie";

  @override
  Future<List<MovieModel>> getMovies() async {
    final prefs = await SharedPreferences.getInstance();
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
    final prefs = await SharedPreferences.getInstance();
    final favoriteMovies = prefs.getStringList(featuredKey);
    if (favoriteMovies == null) {
      prefs.setStringList(featuredKey, [jsonEncode(movie.toJson())]);
      return;
    }
    prefs.setStringList(
      featuredKey,
      favoriteMovies..add(jsonEncode(movie.toJson())),
    );
  }

  @override
  Future<void> setMovies(List<MovieModel> movies) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        featuredKey, movies.map((e) => jsonEncode(e.toJson())).toList());
  }

  @override
  Future<void> remove(MovieModel movie) async {
    final favoritesMovies = await getMovies();
    if (favoritesMovies.isEmpty) return;
    setMovies(favoritesMovies..removeWhere((e) => e.id == movie.id));
  }
}
