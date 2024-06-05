import 'movie_model.dart';

/// A class that represents the current list of [MovieModel] from an Api Movie call.
///
/// See also
/// - [PageMovieModel.fromJson] factory.
class PageMoviesModel {

  /// The current page number linked to the list of [MovieModel]
  final int page;

  /// The list of [MovieModel] return by the API fetch request
  final List<MovieModel> results;

  PageMoviesModel({required this.page, required this.results});

  /// A factory for api json deserialization
  ///
  /// @params: [json] of [Map] with key: [String], and value: [dynamic]
  /// @return: a [PageMoviesModel] object
  ///
  /// See also
  ///   - [MovieModel.fromJson] factory
  factory PageMoviesModel.fromJson(Map<String, dynamic> json) {
    return PageMoviesModel(
      page: json['page'],
      results:
          (json['results'] as List).map((e) => MovieModel.fromJson(e)).toList(),
    );
  }
}
