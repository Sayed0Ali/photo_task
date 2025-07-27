import 'package:dio/dio.dart';
import '../api/web_services/pexels_api_service.dart';

class ApiClient {
  static const String apiKey =
      'y79yKwqVa8wehXvlWF9oqmlrTaNdF6c5NPTa13nBsjOYZDiDIfWjyXjc';

  static PexelsApiService create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://api.pexels.com/v1/",
        headers: {'Authorization': apiKey, 'Content-Type': 'application/json'},
      ),
    );

    return PexelsApiService(dio);
  }
}
