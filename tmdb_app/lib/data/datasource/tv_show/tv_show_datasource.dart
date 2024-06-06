import 'package:tmdb_app/data/model/tv_show/page_series_model.dart';
import 'package:tmdb_app/data/model/tv_show/tv_show_model.dart';

import '../base_datasource.dart';

class TvShowDatasource extends BaseDatasource<TvShowModel, TvShowModel> {
  @override
  String get featuredRoute => "/tv";

  @override
  Future<List<TvShowModel>> fetchData() async {
    final Map<String, String> queryParameters = {
      "include_adult": "false",
      "language": "fr-FR",
    };
    try {
      final dioResponse = await client.get("/discover/$featuredRoute",
          queryParameters: queryParameters);
      final pageSeriesModel = PageSeriesModel.fromJson(dioResponse.data);
      return pageSeriesModel.results.take(10).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<TvShowModel> getDetails(TvShowModel model) async {
    final Map<String, String> queryParameters = {
      "include_adult": "false",
      "language": "fr-FR",
    };
    try {
      final dioResponse = await client.get(
        "$featuredRoute/${model.id}",
        queryParameters: queryParameters,
      );
      return TvShowModel.fromJson(dioResponse.data);
    } on Exception {
      return TvShowModel(
        id: model.id,
        name: model.name,
        overview: model.overview,
        posterPath: model.posterPath,
      );
    }
  }
}
