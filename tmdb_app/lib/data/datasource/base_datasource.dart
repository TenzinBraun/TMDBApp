import 'package:dio/dio.dart';
import 'package:tmdb_app/config/http/app_client.dart';

abstract class BaseDatasource {
  Dio client = AppClient.dio;

  String get featuredRoute;
}
