import 'package:tmdb_app/data/model/tv_show/page_series_model.dart';
import 'package:tmdb_app/data/model/tv_show/tv_show_model.dart';

import '../../../domain/entities/movie.dart';
import '../../model/movie/movie_model.dart';
import '../../model/movie/page_movie_model.dart';
import '../base_datasource.dart';

/// The datasource the handle the api logic of [Movie] features
///
/// See also
///  - [featuredRoute] properties
///  - [fetchData] method
class MovieDatasource extends BaseDatasource<MovieModel, Movie> {
  /// @override [featuredRoute] of [BaseDatasource] to match the wanted api feature
  @override
  String get featuredRoute => "/movie";

  /// Fetches a list of [MovieModel] from the TMDB API.
  ///
  /// This method sends a GET request to the specified [featuredRoute] with
  /// query parameters to exclude adult content and set the language to French.
  ///
  /// @params: empty.
  /// @return: a [Future] that resolves to a list of [MovieModel] objects.
  ///
  /// Throws a [DioError] if the HTTP request fails.
  /// and return an empty list of [MovieModel]
  @override
  Future<List<MovieModel>> fetchData() async {
    final Map<String, String> queryParameters = {
      "include_adult": "false",
      "language": "fr-FR",
    };
    try {
      final dioResponse = await client.get("/discover/$featuredRoute",
          queryParameters: queryParameters);
      final pageMovieModel = PageMoviesModel.fromJson(dioResponse.data);
      return pageMovieModel.results.take(10).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<MovieModel> getDetails(Movie model) async {
    final Map<String, String> queryParameters = {
      "include_adult": "false",
      "language": "fr-FR",
    };
    try {
      final dioResponse = await client.get(
        "$featuredRoute/${model.id}",
        queryParameters: queryParameters,
      );
      return MovieModel.fromJson(dioResponse.data);
    } on Exception {
      return MovieModel(
        id: model.id,
        title: model.title,
        overview: model.overview,
        posterPath: model.posterPath,
      );
    }
  }
}
