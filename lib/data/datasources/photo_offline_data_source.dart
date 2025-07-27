
import '../../domain/model/photo_model.dart';

abstract class PhotoOfflineDataSource {
  Future<void> savePhotos(List<Photo> photos, int page);
  Future<List<Photo>> getPhotos(int page);
}
