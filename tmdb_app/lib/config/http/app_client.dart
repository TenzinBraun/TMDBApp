import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppClient {
  static const String apiKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4OTZjN2VhYTAzMzViZDU2NGI4MWNlMmJhNWMzYjM5ZSIsInN1YiI6IjY2NTk5NTc1MTM1MDVkY2VjYzUwOGY5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mY-mxgg3oOwG1kc94dyO2jXF0Smd9RPP41vTKg31fwg";

  static String securedApiKey = dotenv.env['API_KEY'] ?? 'Default API Key';
  static String token = "Bearer $securedApiKey";
  static Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": token,
  };
  static const String baseUrl = "https://api.themoviedb.org/3/discover";

  static Dio get dio {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.headers = headers;
    return dio;
  }
}
