import '../base_model.dart';

class TvShowModel extends BaseModel {
  final String name;

  TvShowModel({
    required super.id,
    required super.overview,
    required super.posterPath,
    required this.name,
  });

  /// A factory for api json deserialization
  ///
  /// @params: [json] of [Map] with key: [String], and value: [dynamic]
  /// @return: a [MovieModel] object
  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      overview: json['overview'] ?? "",
      posterPath: json['poster_path'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'overview': overview,
        'poster_path': posterPath,
      };
}
