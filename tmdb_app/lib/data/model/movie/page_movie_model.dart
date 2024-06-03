import 'movie_model.dart';

class PageMovieModel {
  final int page;
  final List<MovieModel> results;

  PageMovieModel({required this.page, required this.results});

  factory PageMovieModel.fromJson(Map<String, dynamic> json) {
    return PageMovieModel(
      page: json['page'],
      results:
          (json['results'] as List).map((e) => MovieModel.fromJson(e)).toList(),
    );
  }
}
