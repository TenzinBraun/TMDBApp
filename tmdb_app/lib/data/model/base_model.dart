abstract class BaseModel {
  /// The id of the [Model]
  final int id;

  /// The small description of the [Model] can be empty.
  final String overview;

  /// The relative path representing the picture of the [Model]
  /// The base url isn't include inside
  ///
  /// See more
  ///   - base_url, file_size and file_path
  ///     explanation at : https://developer.themoviedb.org/docs/image-basics
  final String posterPath;

  BaseModel(
      {required this.id, required this.overview, required this.posterPath});
}
