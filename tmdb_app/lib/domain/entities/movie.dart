/// This class represent the movie feature.
///
/// See also
///  - [copyWith] method.
class Movie {
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

  /// The indicator to know if the movie is marked as favorite
  bool isFavorite;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    this.isFavorite = false,
  });


  /// A method that allows us to create a new referenced [Movie] object
  /// from named parameters.
  ///
  /// @params: [id], [title], [overview], [posterPath], [isFavorite]
  /// @return: return a [Movie] object.
  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
    bool? isFavorite,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
