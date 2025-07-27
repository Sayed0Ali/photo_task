import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../web_services/pexels_api_service.dart';

@module
abstract class NetworkModule {
  static const String _pexelsBaseUrl = "https://api.pexels.com/v1/";
  static const String _pexelsApiKey = "y79yKwqVa8wehXvlWF9oqmlrTaNdF6c5NPTa13nBsjOYZDiDIfWjyXjc"; // حط API Key هنا

  @singleton
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: _pexelsBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        "Authorization": _pexelsApiKey,
      },
    );
  }

  @singleton
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    );
  }

  @singleton
  Dio provideDio(BaseOptions options, PrettyDioLogger logger) {
    final dio = Dio(options);
    dio.interceptors.add(logger);
    return dio;
  }

  @singleton
  PexelsApiService providePexelsApiService(Dio dio) {
    return PexelsApiService(dio);
  }
}
