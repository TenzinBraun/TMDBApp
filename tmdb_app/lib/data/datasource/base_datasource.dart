import 'package:dio/dio.dart';

import '../../config/http/app_client.dart';
import '../model/movie/movie_model.dart';



/// The abstract class that represents
/// the minimal datasource configuration for the wanted feature.
///
/// See also
///   - [AppClient.dio] properties.
///   - [featuredRoute] properties.
///   - [fetchMovies] method.
abstract class BaseDatasource {

  /// The client with the base configuration for api request.
  Dio client = AppClient.dio;

  /// Call api using [client] and [featuredRoute] to get movies.
  ///
  /// @params: empty.
  /// @return: a [Future] of list of [MovieModel]
  Future<List<MovieModel>> fetchMovies();

  /// the featured route implemented with the datasource.
  String get featuredRoute;
}
