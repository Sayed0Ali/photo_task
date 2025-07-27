import '../../domain/model/photo_model.dart';
abstract class PhotoOnlineDataSource {
  Future<List<Photo>> getCuratedPhotos({
    required int page,
    required int perPage,
  });
}
