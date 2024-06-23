import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppClient {
  static String securedApiKey = dotenv.env['API_KEY'] ?? 'Or Paste your API KEY here.';
  static String token = "Bearer $securedApiKey";
  static Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": token,
  };
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String imageUrl = "https://image.tmdb.org/t/p/w500";

  static Dio get dio {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.headers = headers;
    return dio;
  }
}
