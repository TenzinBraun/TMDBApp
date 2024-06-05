
/// A class that represents our Movie Api Model.
///
/// See also
/// - [MovieModel.fromJson] factory.
class MovieModel {

  /// The id of the [Movie]
  final int id;

  /// The title of the [Movie]
  final String title;

  /// The small description of the [Movie] can be empty.
  final String overview;

  /// The relative path representing the picture of the [Movie]
  /// The base url isn't include inside
  ///
  /// See more
  ///   - base_url, file_size and file_path
  ///     explanation at : https://developer.themoviedb.org/docs/image-basics
  final String posterPath;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });


  /// A factory for api json deserialization
  ///
  /// @params: [json] of [Map] with key: [String], and value: [dynamic]
  /// @return: a [MovieModel] object
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }
}