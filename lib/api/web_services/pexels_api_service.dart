import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../model/response/photo_response.dart';

part 'pexels_api_service.g.dart';

@RestApi(baseUrl: "https://api.pexels.com/v1/")
abstract class PexelsApiService {
  factory PexelsApiService(Dio dio, {String baseUrl}) = _PexelsApiService;

  @GET("curated")
  Future<PhotoResponse> getCuratedPhotos(
    @Query("page") int page,
    @Query("per_page") int perPage,
  );
}
