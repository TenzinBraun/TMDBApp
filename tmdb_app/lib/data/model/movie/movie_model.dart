import 'package:tmdb_app/data/model/base_model.dart';

/// A class that represents our Movie Api Model.
///
/// See also
/// - [MovieModel.fromJson] factory.
class MovieModel extends BaseModel {
  /// The title of the [Movie]
  final String title;

  MovieModel({
    required super.id,
    required this.title,
    required super.overview,
    required super.posterPath,
  });

  /// A factory for api json deserialization
  ///
  /// @params: [json] of [Map] with key: [String], and value: [dynamic]
  /// @return: a [MovieModel] object
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "$json",
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'overview': overview,
        'poster_path': posterPath,
      };
}
