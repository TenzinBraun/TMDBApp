import 'package:dio/dio.dart';
import 'package:tmdb_app/data/model/base_model.dart';

import '../../config/http/app_client.dart';
import '../../domain/entities/movie.dart';
import '../model/movie/movie_model.dart';

/// The abstract class that represents
/// the minimal datasource configuration for the wanted feature.
///
/// See also
///   - [AppClient.dio] properties.
///   - [featuredRoute] properties.
///   - [fetchData] method.
abstract class BaseDatasource<Model extends BaseModel, Entity> {
  /// The client with the base configuration for api request.
  Dio client = AppClient.dio;

  /// Call api using [client] and [featuredRoute] to get movies.
  ///
  /// @params: empty.
  /// @return: a [Future] of list of [MovieModel]
  Future<List<Model>> fetchData();

  Future<Model> getDetails(Entity model);

  /// the featured route implemented with the datasource.
  String get featuredRoute;
}
