
import '../model/photo_model.dart';

abstract class PhotoRepository {
  Future<List<Photo>> getPhotos(int page, int perPage);
}
