import 'package:tmdb_app/data/model/movie/page_movie_model.dart';

import '../model/movie/movie_model.dart';
import 'base_datasource.dart';

class MovieDatasource extends BaseDatasource {
  /// @override [featuredRoute] of [BaseDatasource] to match the wanted api feature
  @override
  String get featuredRoute => "/movie";

  /// Fetches a list of movies from the TMDB API.
  ///
  /// This method sends a GET request to the specified [featuredRoute] with
  /// query parameters to exclude adult content and set the language to French.
  ///
  /// Returns a [Future] that resolves to a list of [MovieModel] objects.
  ///
  /// Throws a [DioError] if the HTTP request fails.
  /// and return an empty list of [MovieModel]
  Future<List<MovieModel>> fetchMovies() async {
    final Map<String, String> queryParameters = {
      "include_adult": "false",
      "language": "fr-FR",
    };
    try {
      final dioResponse =
          await client.get(featuredRoute, queryParameters: queryParameters);
      final pageMovieModel = PageMovieModel.fromJson(dioResponse.data);
      return pageMovieModel.results;
    } catch (e) {
      return [];
    }
  }
}
