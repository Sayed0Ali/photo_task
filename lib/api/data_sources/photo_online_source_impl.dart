import 'package:injectable/injectable.dart';
import 'package:task_photo/data/datasources/photo_online_source.dart';
import '../../domain/model/photo_model.dart';
import '../web_services/pexels_api_service.dart';

@Injectable(as: PhotoOnlineDataSource)
class PhotoOnlineDataSourceImpl implements PhotoOnlineDataSource {
  final PexelsApiService _pexelsApiService;

  PhotoOnlineDataSourceImpl(this._pexelsApiService);

  @override
  Future<List<Photo>> getCuratedPhotos({
    required int page,
    required int perPage,
  }) async {
    final response = await _pexelsApiService.getCuratedPhotos(page, perPage);
    return response.photos;
  }
}
